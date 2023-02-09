class FoodsController < ApplicationController
    def index
        @foods = Food.where(user_id: current_user.id)
    end

    def new
        new_food = Food.new
        respond_to do |format|
            format.html { render :new, locals: { food: new_food } }
        end
    end

    def create
        food_params = params.require(:new_food).permit(:name, :measurement_unit, :price, :quantity)
        food = Food.new(food_params)
        food.user = current_user
        respond_to do |format|
            format.html do
                if food.save
                    flash[:notice] = 'Food created successfully'
                    redirect_to foods_path
                else
                    Rails.logger.error(food.errors.full_messages)
                    flash.now[:alert] = 'Food creation failed'
                    render :new, locals: { food: food }
                end
            end
        end
    end
end