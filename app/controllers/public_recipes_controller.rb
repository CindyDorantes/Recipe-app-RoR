class PublicRecipesController < ApplicationController
  def index
    # users = User.includes(:address, friends: [:address, :followers])
    @public_recipes = Recipe.where(public: true).includes(:user, recipe_foods: [:food])
  end
end
