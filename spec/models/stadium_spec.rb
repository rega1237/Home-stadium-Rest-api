require 'rails_helper'

RSpec.describe Stadium, type: :model do
  before :each do
    @stadium = Stadium.create(
      name: 'Stadium`s name',
      country: 'Stadium`s Country',
      seats: 10,
      photo: 'Stadium`s photo'
    )
  end

  describe 'Stadium model' do
    it 'Stadium has been created valid' do
      expect(@stadium).to be_valid
    end

    it 'should have a name' do
      @stadium.name = nil
      expect(@stadium).to_not be_valid
    end

    it 'should have a country' do
      @stadium.country = nil
      expect(@stadium).to_not be_valid
    end

    it 'should have seats' do
      @stadium.seats = nil
      expect(@stadium).to_not be_valid
    end

    it 'should have photo' do
      @stadium.photo = nil
      expect(@stadium).to_not be_valid
    end
  end
end
