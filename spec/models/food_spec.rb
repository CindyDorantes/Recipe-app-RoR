require 'rails_helper'

RSpec.describe Food, type: :model do
  # tests go here

  before :each do
    @user = User.create(
      name: 'Microverse',
      email: 'd@gmail.com',
      password: 'password'
    )

    @food = Food.create(name: 'orange', price: 12, quantity: 5, measurement_unit: 'pieces', user: @user)
  end

  context 'Test food validations' do
    it 'is valid with valid attributes' do
      expect(@food).to be_valid
    end

    it 'name must not be blank' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'price must not be blank' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'price must be and integer' do
      @food.price = 'foo'
      expect(@food).to_not be_valid
    end

    it 'quantity must not be blank' do
      @food.quantity = nil
      expect(@food).to_not be_valid
    end

    it 'quantity must be and integer' do
      @food.quantity = 'foo'
      expect(@food).to_not be_valid
    end
  end
end
