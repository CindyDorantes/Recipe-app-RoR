require 'rails_helper'

RSpec.describe Food, type: :model do
  # tests go here
  user = User.create(name: 'Tom')
  subject { Food.create(name: 'orange', price: 12, quantity: 5, measurement_unit: 'pieces', user:) }

  before { subject.save }

  context 'Test food validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'price must not be blank' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'price must be and integer' do
      subject.price = 'foo'
      expect(subject).to_not be_valid
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
