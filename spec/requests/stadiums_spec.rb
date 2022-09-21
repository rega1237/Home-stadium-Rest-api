require 'rails_helper'

RSpec.describe 'Stadiums', type: :request do
  include Warden::Test::Helpers

  before :all do
    @user = User.order(:id).first
    @stadium = Stadium.order(:id).first
    post auth_login_path, headers: { 'Content-Type': 'application/json' }, params: { username: @user.username }.to_json
    @token = JSON.parse(response.body)['token']
  end

  describe 'Stadiums`s Actions' do
    it 'Return Index success' do
      get stadiums_path, headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'Return Show success' do
      get stadium_path(@stadium.id), headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end

    it 'Return Create success' do
      post stadiums_path, headers: { 'Content-Type': 'application/json', Authorization: @token }, params: {
        name: 'Stadium`s name',
        country: 'Stadium`s country',
        seats: 10,
        photo: 'Stadium`s photo'
      }.to_json
      expect(response).to have_http_status(:success)
    end

    it 'Return Delete success' do
      delete stadium_path(@stadium.id), headers: { 'Content-Type': 'application/json', Authorization: @token }
      expect(response).to have_http_status(:success)
    end
  end
end
