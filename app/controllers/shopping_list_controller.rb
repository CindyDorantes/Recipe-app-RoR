class ShoppingListController < ApplicationController
  include ShoppingListHelper
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @foods = Food.where(user_id: current_user.id)

    # Flatten the recipes into a single array of required food objects
    @required_foods = @recipes.flat_map do |recipe|
      recipe.recipe_foods.map do |recipe_food|
        food = recipe_food.food
        food[:quantity] = recipe_food.quantity
        food
      end
    end

    # create a hash of available food items with their quantities
    stock_hash = @foods.to_h { |food| [food.name, food.quantity] }

    # compare required foods to available foods and add missing foods to the shopping list
    @missing_foods = diff_in_stock(stock_hash, @required_foods)

    @combined_foods = combine_foods(@missing_foods)

    @total_price = helpers.calculate_total_price(@combined_foods)
  end
end
