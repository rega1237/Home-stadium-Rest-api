require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  include Warden::Test::Helpers

  before :all do
    @user = User.order(:id).first
    @stadium = Stadium.order(:id).first
    @game = Game.order(:id).first
    @team_one = Team.order(:id).first
    @team_two = Team.order(:id).last
    @resevation = Reservation.order(:id).first
    post auth_login_path, headers: { 'Content-Type': 'application/json' }, params: { username:@user.username }.to_json  
    @token = JSON.parse(response.body)['token']
  end

  describe 'Games`s Actions' do
    it 'Return Show success' do
      get stadium_game_path(@stadium.id, @game.id), headers: { 'Content-Type': 'application/json', 'Authorization': @token }, params: { username:@user.username }.to_json
      expect(response).to have_http_status(:success)
    end

    it 'Return Create success' do
      post stadium_games_path(@stadium.id), headers: { 'Content-Type': 'application/json', 'Authorization': @token }, params: { 
        game: {
          date: '01-01-1011',
          stadium_id: @stadium.id,
          available_seats: 10,
          team_one: @team_one.id,
          team_two: @team_two.id
        }
      }.to_json
      expect(response).to have_http_status(:success)
    end

    it 'Return Delete success' do
      delete stadium_game_path(@stadium.id, @game.id), headers: { 'Content-Type': 'application/json', 'Authorization': @token }, params: { username:@user.username }.to_json
      expect(response).to have_http_status(:success)
    end
  end
end
