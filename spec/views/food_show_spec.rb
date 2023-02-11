require 'rails_helper'

RSpec.describe 'Foods index page', type: :feature do
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
  end

  describe 'the foods index page' do
    it 'displays the food name' do
      visit foods_path
      expect(page).to have_content(@food.name)
    end
  end
end
