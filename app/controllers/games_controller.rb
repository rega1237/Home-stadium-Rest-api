class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    render json: {all_data: { games: @game, team_a: @game.team_a.name, team_b: @game.team_b.name }}, status: :ok
  end

  def create
    @game = Game.new(games_params)
    @game.stadium_id = params[:stadium_id]
    @game.team_a = Team.find(params[:game][:team_a])
    @game.team_b = Team.find(params[:game][:team_b])
    if @game.save
      render json: @game, status: :ok
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  def delete

  end

  private

  def games_params
    params.require(:game).permit(:date)
  end
end
