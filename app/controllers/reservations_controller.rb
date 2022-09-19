class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]

  def index
    @reservations = Reservation.where(user_id: @current_user_id)
    render json: @reservations, each_serializer: ReservationsSerializer
  end

  def show
    render json: @reservation, serializer: ReservationsSerializer
  end

  def create
    @game = Game.find(params[:reservation][:game_id])
    @reservation = Reservation.new(reservation_params)
    @reservation = @game.reservations.create(reservation_params)
    @reservation.user = @current_user_id
    if @reservation.save
      render json: @reservation, status: :created
    else
      render json: @reservation.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    # implement
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserved_seats)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
