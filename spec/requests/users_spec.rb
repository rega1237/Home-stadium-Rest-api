require 'rails_helper'
require_relative 'requests_context'

RSpec.describe 'Users', type: :request do
  include Warden::Test::Helpers
  include_context 'request_context'

  describe 'action users#current' do
    context 'when logged in' do
      it 'returns http_success' do
        expect(response).to have_http_status(:success)
      end

      it 'returns current user info' do
        @body = JSON.parse(response.body)
        expect(@body['username']).to eq user.username
        expect(@body['user_id']).to eq user.id
        expect(@body['token']).to be_truthy
      end
    end
  end
end
