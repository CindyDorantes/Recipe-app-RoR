class ShoppingListController < ApplicationController
    def index
        @recipes = Recipe.where(user_id: current_user.id)
        @recipes.each do |recipe|
            Rails.logger.info(recipe.foods)
        end
        @foods = Food.where(user_id: current_user.id)
        @foods.each do |food|
            Rails.logger.info(food)
        end
        @required_foods = []
        @recipes.each do |recipe|
            @required_foods << recipe.foods
        end

        Rails.logger.info(@required_foods)
        
        @required_foods.each do |required_food|
            Rails.logger.info(required_food)
        end

        #flatten the available foods into a single array of Food objects
        available_foods = @foods.to_a

        #create a hash of available foods items with their quantities
        stock_hash = {}
        available_foods.each do |food|
            stock_hash[food.name] = food.quantity
        end

        #create an array to missing food items
        missing_foods = []

        #compare required foods to available foods and add missing foods to the shopping list
        @required_foods.each do |required_food|
            if !stock_hash.include?(required_food.name) || stock_hash[required_food.name] < required_food.quantity
                missing_foods << required_food
            end
        end
        
        missing_foods

    end
end