require 'rails_helper'

RSpec.describe User, type: :model do
  # tests go here
  subject { User.create(name: 'Tom') }

  before { subject.save }

  context 'Test user validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
