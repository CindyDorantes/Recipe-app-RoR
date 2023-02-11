require 'rails_helper'

RSpec.describe Recipe, type: :model do
<<<<<<< HEAD
  subject do
    User.create(name: 'Tom', email: 'tom@gmail.com', password: '123abc', password_confirmation: '123abc')
  end
  before do
    @recipe = Recipe.create(name: 'Cake', preparation_time: '2 hours', cooking_time: '30 minutes',
                            description: 'deliciouos cake', public: true, user: subject)
=======
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

>>>>>>> 423a220 (Rebase current development with integration tests branch)
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
