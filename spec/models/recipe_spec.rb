require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # tests go here
  user = User.create(name: 'Tom', email: 'tom@gmail.com')
  subject do
    Recipe.create(name: 'Cake', preparation_time: '2 hours', cooking_time: '30 minutes', description: 'deliciouos cake',
                  user:)
  end

  before { subject.save }

  context 'Test Recipe validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
