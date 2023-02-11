require 'rails_helper'

RSpec.describe 'Foods', type: :request do
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

  it 'should get index' do
    get foods_path
    expect(response).to have_http_status(200)
  end

  it 'returns correct show template' do
    get foods_path
    expect(response).to render_template(:index)
  end

  it 'gets correct response body' do
    get user_post_path(@user, @post)
    expect(response.body).to include('Unit Price')
  end
end
