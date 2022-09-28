class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show destroy]

  def index
    @reservations = Reservation.where(user_id: @current_user_id).includes([game: %i[teams stadium]])
    render json: @reservations, each_serializer: ReservationsSerializer, status: :ok
  end

  def show
    render json: @reservation, serializer: ReservationsSerializer
  end

  def create
    if valid_seats
      @reservation = create_reservation
      if @reservation.save
        render json: @reservation, status: :created
      else
        render json: @reservation.errors.full_messages, status: :unprocessable_entity
      end
    else
      render json: { error: 'Not enough seats available' }, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    render json: @stadium, status: :ok
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reserved_seats)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def valid_seats
    @game = Game.find(params[:reservation][:game_id])
    @game.available_seats >= params[:reservation][:reserved_seats].to_i
  end

  def create_reservation
    reservation = Reservation.new(reservation_params)
    reservation.game_id = @game.id
    reservation.user = @current_user_id
    @game.reservations << reservation
    reservation
  end
end
