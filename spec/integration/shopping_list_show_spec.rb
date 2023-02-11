require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Microverse', email: 'd@gmail.com', password: 'password')

    @food = Food.create(name: 'orange', price: 12, quantity: 5, measurement_unit: 'pieces', user: @user)

    @food2 = Food.create(user: @user, name: 'Sardines', measurement_unit: 'KGs', price: 10_000, quantity: 2)

    @recipe = Recipe.create(user: @user, name: 'Fish Marinated', preparation_time: '2 HR', cooking_time: '30 MIN',
                            description: 'This is', public: true)

    @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 3)

    @recipe_food2 = RecipeFood.create(recipe: @recipe, food: @food2, quantity: 5)

    sign_in(@user)
  end

  describe 'the shopping list page' do
    it 'displays the food2 name' do
      visit shopping_list_path
      expect(page).to have_content(@food2.name)
    end

    it 'displays amount needed to shop food fish' do
      visit shopping_list_path
      expect(page).to have_content(@food2.price * (@recipe_food2.quantity - @food2.quantity))
    end
  end
end
