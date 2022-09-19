require 'rails_helper'

RSpec.describe Game, type: :model do
  before :each do
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
  end

  describe 'Game model' do
    it 'should be valid' do
      expect(@game).to be_valid
    end

    it 'should have a Stadium' do
      @game.stadium = nil
      expect(@game).to_not be_valid
    end

    it 'should have a date' do
      @game.date = nil
      expect(@game).to_not be_valid
    end

    it 'should have available seats' do
      @game.available_seats = nil
      expect(@game).to_not be_valid
    end
  end
end
