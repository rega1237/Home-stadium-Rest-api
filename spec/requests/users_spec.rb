require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include Warden::Test::Helpers

  before :all do
    @user = User.order(:id).first
    post auth_login_path, headers: { 'Content-Type': 'application/json' }, params: { username:@user.username }.to_json  
    # @token = JSON.parse(response.body)['token']
  end

  describe 'action users#current' do
    context 'when logged in' do
      it 'returns http_success' do
        expect(response).to have_http_status(:success)
      end

    end
  end
end
