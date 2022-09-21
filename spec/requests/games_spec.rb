require 'rails_helper'

RSpec.describe GamesController, type: :request do
  include Warden::Test::Helpers

  before :each do
    @user = User.create(
      username: 'username'
    )

    login_as(@user, scope: :user)

    @stadium = Stadium.create(
      name: 'Stadium`s name',
      country: 'Stadium`s country',
      seats: 10,
      photo: 'Stadium`s photo'
    )

    @game = Game.create(
      date: '01-01-1011',
      stadium_id: @stadium.id,
      available_seats: 5
    )
  end

  describe 'GET #show' do
    it 'should return a success response' do
      get stadium_game_path(@game)
      expect(response).to be_successful
    end

    it 'should return a 200 response' do
      get stadium_game_path(@stadium)
      expect(response).to have_http_status 'ok'
    end

    it 'should return a list of games' do
      get stadium_game_path(@stadium)
      expect(response.body).to include @game.date
    end
  end
end
