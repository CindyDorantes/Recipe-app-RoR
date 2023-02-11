require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    User.create(name: 'Tom', email: 'tom@gmail.com', password: '123abc', password_confirmation: '123abc')
  end
  before { @food = Food.create(name: 'orange', price: 12, quantity: 5, measurement_unit: 'pieces', user: subject) }
  before do
    @recipe = Recipe.create(name: 'Cake', preparation_time: '2 hours', cooking_time: '30 minutes',
                            description: 'deliciouos cake', user: subject)
  end
  before { @recipe_food = RecipeFood.create(quantity: 5, recipe: @recipe, food: @food) }

  context 'Test Recipe validations' do
    it 'is valid with valid attributes' do
      expect(@recipe_food).to be_valid
    end

    it 'quantity must not be blank' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'quantity must be and integer' do
      @recipe_food.quantity = 'foo'
      expect(@recipe_food).to_not be_valid
    end
  end
end
