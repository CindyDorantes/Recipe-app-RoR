require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  # tests go here
  user = User.create(name: 'Tom')
  recipe = Recipe.create(name: 'Cake', preparation_time: '2 hours', cooking_time: '30 minutes',
                         description: 'deliciouos cake', user:)
  food = Food.create(name: 'orange', price: 12, quantity: 5, measurement_unit: 'pieces', user:)

  subject { RecipeFood.create(recipe:, food:, quantity: 6) }
  before { subject.save }

  context 'Test Recipe validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'quantity must not be blank' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'quantity must be and integer' do
      subject.quantity = 'foo'
      expect(subject).to_not be_valid
    end
  end
end
