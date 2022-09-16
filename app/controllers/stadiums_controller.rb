class StadiumsController < ApplicationController
  def index
    @stadiums = Stadium.all
    render json: @stadiums, status: :ok
  end

  def show
    @stadium = Stadium.find(params[:id])
    render json: @stadium, status: :ok
  end

  def create
    @stadium = Stadium.new(stadium_params)
    if @stadium.save
      render json: @stadium, status: :created
    else
      render json: @stadium.errors, status: :unprocessable_entity
    end
  end

  private

  def stadium_params
    params.require(:stadium).permit(:name, :county, :seats)
  end
end
