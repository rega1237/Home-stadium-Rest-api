class StadiumsController < ApplicationController
  before_action :set_stadium, only: [:show, :destroy]

  def index
    @stadiums = Stadium.all
    render json: @stadiums, status: :ok
  end

  def show
    render json: @stadium, serializer: StadiumsSerializer
  end

  def create
    @stadium = Stadium.new(stadium_params)
    if @stadium.save
      render json: @stadium, status: :created
    else
      render json: @stadium.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @stadium.destroy
    render json: @stadium, status: :ok
  end 

  private

  def stadium_params
    params.require(:stadium).permit(:name, :county, :seats, :photo)
  end

  def set_stadium
    @stadium = Stadium.find(params[:id])
  end
end
