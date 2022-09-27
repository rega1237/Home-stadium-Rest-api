require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :each do
    @user = User.create(
      username: 'username'
    )
    @stadium = Stadium.create(
      name: 'Stadium`s name',
      country: 'Stadium`s Country',
      seats: 10,
      photo: 'Stadium`s photo'
    )
    @game = Game.create(
      stadium: @stadium,
      date: '01-01-1011',
      available_seats: @stadium.seats
    )
    @reservation = Reservation.create(
      user_id: @user.id,
      game_id: @game.id,
      reserved_seats: 5
    )
  end

  describe 'resevation model' do
    it 'Reservation has been created valid' do
      expect(@reservation).to be_valid
    end

    it 'should have a User' do
      @reservation.user_id = nil
      expect(@reservation).to_not be_valid
    end

    it 'should have a resevation' do
      @reservation.game_id = nil
      expect(@reservation).to_not be_valid
    end
  end
end
