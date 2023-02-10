class ShoppingListController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @foods = Food.where(user_id: current_user.id)

    @required_foods = []

    @recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        food = recipe_food.food
        Rails.logger.debug(food.name)
        food[:quantity] = recipe_food.quantity
        Rails.logger.debug(food[:quantity])
        @required_foods << food
      end
    end

    # flatten the available foods into a single array of Food objects
    available_foods = @foods.to_a

    # create a hash of available foods items with their quantities
    stock_hash = {}
    available_foods.each do |food|
      stock_hash[food.name] = food.quantity
    end

    # create an array to missing food items
    @missing_foods = []

    # compare required foods to available foods and add missing foods to the shopping list
    @required_foods.flatten.each do |required_food|
      if stock_hash.include?(required_food.name)
        difference = required_food.quantity - stock_hash[required_food.name]
        if difference.positive?
          stock_hash[required_food.name] = 0
          @missing_foods << { name: required_food.name, required_quantity: difference,
                              price: required_food.price, measurement_unit: required_food.measurement_unit }
        else
          stock_hash[required_food.name] -= required_food.quantity
        end
      else
        stock_hash[required_food.name] = 0
        @missing_foods << { name: required_food.name, required_quantity: required_food.quantity,
                            price: required_food.price, measurement_unit: required_food.measurement_unit }
      end
    end

    grouped_foods = @missing_foods.group_by { |hash| hash[:name] }
    @combined_foods = grouped_foods.map do |name, group|
      {
        name:,
        required_quantity: group.map { |hash| hash[:required_quantity] }.sum,
        price: group.first[:price],
        measurement_unit: group.first[:measurement_unit]
      }
    end

    @total_price = 0
    @combined_foods.each do |missing_food|
      food = Food.find_by(name: missing_food[:name])
      @total_price += missing_food[:required_quantity] * food.price
    end
  end
end
