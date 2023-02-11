require 'rails_helper'

RSpec.feature 'PublicRecipes', type: :feature do
  before :each do
    @user = User.new(name: 'Cindy', email: 'cindy@gmail.com', password: '123abc',
                     password_confirmation: '123abc')
    @user.save
    Recipe.create(name: 'Cake', preparation_time: '2 hours', cooking_time: '30 minutes',
                  description: 'deliciouos cake', user_id: @user.id, public: true)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'password'
    end
    click_button 'Log in'
  end

  it 'visits recipes#show' do
    visit recipes_path
    expect(page).to have_content 'Cake'
  end
end
