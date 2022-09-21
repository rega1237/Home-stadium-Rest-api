require 'rails_helper'

RSpec.describe 'Stadiums', type: :request do
      
      let!(:user) { User.order(:id).first }

    describe 'For allowed user' do
        before do
          login(user)
          get :show, params: { id: 1 }
        end
        
        it { expect(response).to have_http_status(:ok) }
    end
end
