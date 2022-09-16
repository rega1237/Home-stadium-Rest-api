class StadiumsController < ApplicationController
  def index
    @stadiums = Stadium.all
    render json: @stadiums, status: :ok
  end
end
