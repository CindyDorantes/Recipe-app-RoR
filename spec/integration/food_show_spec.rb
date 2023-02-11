require 'rails_helper'

RSpec.describe 'Foods index page', type: :feature do
  before :each do
    @user = User.create(
      name: 'Microverse',
      email: 'd@gmail.com',
      password: 'password'
    )

    @food = Food.create(name: 'orange', price: 12, quantity: 5, measurement_unit: 'pieces', user: @user)

    sign_in(@user)
  end

  describe 'the foods index page' do
    it 'displays the food name' do
      visit foods_path
      expect(page).to have_content(@food.name)
    end
  end
end
