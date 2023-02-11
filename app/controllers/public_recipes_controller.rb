class PublicRecipesController < ApplicationController
  def index
    # users = User.includes(:address, friends: [:address, :followers])
    @public_recipes = Recipe.where(public: true).order('id DESC').includes(:user, recipe_foods: [:food])
  end
end
