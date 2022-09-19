class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]

  def index
    @reservations = Reservation.where(user_id: @current_user_id)
    render json: @reservations, each_serializer: ReservationsSerializer
  end
  
  def show
    render json: @reservation, serializer: ReservationsSerializer
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
