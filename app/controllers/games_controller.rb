class GamesController < ApplicationController

  def create
    @game = Game.new(games_params)
    if @game.save
      render json: @game, status: :ok
    else
      @user = User.find(params[:user_id])
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def delete

  end

  private

  def games_params
    params.require(:game).permit(:team_a, :team_b, :date, :stadium_id)
  end
end
