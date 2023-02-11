require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    User.create(name: 'Tom', email: 'tom@gmail.com', password: '123abc', password_confirmation: '123abc')
  end
  before do
    @recipe = Recipe.create(name: 'Cake', preparation_time: '2 hours', cooking_time: '30 minutes', description: 'deliciouos cake',
                            public: true, user: subject)
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
