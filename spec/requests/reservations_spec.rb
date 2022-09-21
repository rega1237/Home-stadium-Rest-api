require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  include Warden::Test::Helpers

  before :all do
    @user = User.order(:id).first
    @stadium = Stadium.order(:id).first
    @game = Game.order(:id).first
    @team_one = Team.order(:id).first
    @team_two = Team.order(:id).last
    @reservation = Reservation.order(:id).first
    post auth_login_path, headers: { 'Content-Type': 'application/json' }, params: { username: @user.username }.to_json
    @token = JSON.parse(response.body)['token']
  end

  describe 'Reservations`s Actions' do
    it 'Return Index success' do
      get user_reservations_path(@user.id), headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'Return Show success' do
      get user_reservation_path(@user.id, @reservation.id),
          headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'Return Create success' do
      post user_reservations_path(@user.id), headers: { 'Content-Type': 'application/json', Authorization: @token },
                                             params: {
                                               reservation: {
                                                 game_id: @game.id,
                                                 reserved_seats: @game.available_seats
                                               }
                                             }.to_json
      expect(response).to have_http_status(:success)
    end

    it 'Return Delete success' do
      delete user_reservation_path(@user.id, @reservation.id),
             headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end
  end
end
