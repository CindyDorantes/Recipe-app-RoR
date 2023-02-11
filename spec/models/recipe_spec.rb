require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # tests go here
  before :each do
    @user = User.create(
      name: 'Microverse',
      email: 'd@gmail.com',
      password: 'password'
    )

    @recipe = Recipe.new(
      name: 'Burger', preparation_time: 3, cooking_time: 12,
      description: 'Bread and a piece of meat.', public: false, user: @user
    )
  end

  context 'Test Recipe validations' do
    it 'is valid with valid attributes' do
      expect(@recipe).to be_valid
    end

    it 'name must not be blank' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end
  end
end
