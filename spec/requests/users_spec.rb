require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Warden::Test::Helpers

  before :each do
    @user = User.create(
      username: 'username',
    )

    login_as(@user, scope: :user)
  end

  describe 'action users#current' do
    before(:each) do
      post 'http://localhost:3000/auth/login', params: { username: 'username' }
    end

    context 'when logged in' do
      it 'returns http_success' do
        expect(response).to have_http_status(:success)
      end

      # it 'header "Content-Type" contains application/json' do
      #   expect(response.header['Content-Type']).to include('application/json')
      # end

      # it 'returns current user info' do
      #   @body = JSON.parse(response.body)
      #   expect(@body['name']).to eq 'Roberto'
      #   expect(@body['email']).to eq 'roberto@mail.com'
      # end
    end
  end
end
