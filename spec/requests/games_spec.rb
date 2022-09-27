require 'rails_helper'
require_relative 'requests_context'

RSpec.describe GamesController, type: :request do
  include Warden::Test::Helpers
  include_context 'request_context'

  describe 'Games`s Actions' do
    it 'Return Show success' do
      get stadium_game_path(stadium.id, game.id),
          headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'Return Create success' do
      post stadium_games_path(stadium.id), headers: { 'Content-Type': 'application/json', Authorization: @token },
                                           params: {
                                             game: {
                                               date: '01-01-1011',
                                               stadium_id: stadium.id,
                                               available_seats: 10,
                                               team_one: team_one.id,
                                               team_two: team_two.id
                                             }
                                           }.to_json
      expect(response).to have_http_status(:success)
    end

    it 'Return Delete success' do
      delete stadium_game_path(stadium.id, game.id),
             headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end
  end
end
