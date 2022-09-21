require 'rails_helper'

RSpec.describe 'Authentications', type: :request do


  describe 'For allowed user' do
      before do
        @user = User.order(:id).first
        login(@user)
        get :show, params: { id: 1 }
      end
      
      it { expect(response).to have_http_status(:ok) }
  end
end
