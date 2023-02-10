class RecipeFoodsController < ApplicationController
  def index; end

  def new
    @foods = Food.where(user_id: current_user.id)
    @recipe = Recipe.find(params[:recipe_id])
    recipe_food = RecipeFood.new
    respond_to do |format|
      format.html { render :new, locals: { recipe_food: } }
    end
  end

  def create
    new_recipe_food = RecipeFood.new(recipe_id: params[:recipe_id], food_id: params[:recipe_food][:food_id],
                                     quantity: params[:recipe_food][:quantity])
    respond_to do |format|
      format.html do
        if new_recipe_food.save
          flash[:notice] = 'Ingredient added successfully'
          redirect_to recipe_path(new_recipe_food.recipe_id)
        else
          flash.now[:alert] = 'Ingredient creation failed'
          render :new, locals: { recipe: }
        end
      end
    end
  end
end
