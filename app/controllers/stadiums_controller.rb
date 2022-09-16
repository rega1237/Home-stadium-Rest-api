class StadiumsController < ApplicationController
  def index
    @stadiums = Stadium.all
    render json: @stadiums, status: :ok
  end

  def show
    @stadium = Stadium.find(params[:id])
    render json: @stadium, status: :ok
  end
end
