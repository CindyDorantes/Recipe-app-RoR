require 'rails_helper'

RSpec.describe 'Shopping List', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Otim'
    )

    @food = Food.create(
      user: @user,
      name: 'Fish', 
      measurement_unit: 'KGs',
      price: 25000,
      quantity: 2
    )

    @food2 = Food.create(
        user: @user,
        name: 'Sardines',
        measurement_unit: 'KGs',
        price: 10000,
        quantity: 2
    )

    @recipe = Recipe.create(
        user: @user,
        name: 'Fish Marinated',
        preparation_time: '2 HR',
        cooking_time: '30 MIN',
        description: 'This is',
        public: true
    )

    @recipe_food = RecipeFood.create(
        recipe: @recipe,
        food: @food,
        quantity: 3
    )

    @recipe_food2 = RecipeFood.create(
        recipe: @recipe,
        food: @food2,
        quantity: 5
    )
  end

  it 'should get index' do
    get shopping_list_path
    expect(response).to have_http_status(200)
  end

  it 'returns correct index template' do
    get shopping_list_path
    expect(response).to render_template(:index)
  end

  it 'gets correct response body' do
    get shopping_list_path
    expect(response.body).to include('Shopping List')
  end
end
