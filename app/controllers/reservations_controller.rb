class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: @current_user_id)
    render json: @reservations, each_serializer: ReservationsSerializer
  end
end
