require 'rails_helper'
require_relative 'requests_context'

RSpec.describe 'Reservations', type: :request do
  include Warden::Test::Helpers
  include_context 'request_context'

  describe 'Reservations`s Actions' do
    it 'Return Index success' do
      get user_reservations_path(user.id), headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'Return Show success' do
      get user_reservation_path(user.id, reservation.id),
          headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'Return Create success' do
      post user_reservations_path(user.id), headers: { 'Content-Type': 'application/json', Authorization: @token },
                                            params: {
                                              reservation: {
                                                game_id: game.id,
                                                reserved_seats: game.available_seats
                                              }
                                            }.to_json
      expect(response).to have_http_status(:success)
    end

    it 'Return Delete success' do
      delete user_reservation_path(user.id, reservation.id),
             headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end
  end
end
