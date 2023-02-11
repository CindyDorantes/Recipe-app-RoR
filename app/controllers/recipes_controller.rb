class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
  end

  def new
    recipe = Recipe.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: } }
    end
  end

  def create
    recipe = params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    new_recipe = Recipe.new(recipe)
    new_recipe.user = current_user
    respond_to do |format|
      format.html do
        if new_recipe.save
          flash[:notice] = 'Recipe created successfully'
          redirect_to recipes_path
        else
          flash.now[:alert] = 'Recipe creation failed'
          render :new, locals: { recipe: }
        end
      end
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = 'Recipe deleted successfully'
        redirect_to recipes_path
      end
    end
  end

  # def destroy
  #   @recipe = Recipe.find(params[:id])
  #   @recipe.destroy
  #   redirect_to recipes_path, notice: 'Recipe deleted successfully'
  # end
end
