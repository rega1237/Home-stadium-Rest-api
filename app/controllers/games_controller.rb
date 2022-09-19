class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    render json: {
             all_data: {
               games: @game,
               teams: @game.teams,
               stadium: @game.stadium,
               seats: @game.available_seats
             }
           },
           status: :ok
  end

  def create
    @game = Game.new(games_params)
    @game.stadium_id = params[:stadium_id]
    @team_one = Team.find(params[:game][:team_one])
    @team_two = Team.find(params[:game][:team_two])
    @game.available_seats = @game.stadium.seats
    @game.teams << @team_one
    @game.teams << @team_two
    if @game.save
      render json: {
               all_data: {
                 games: @game,
                 stadium_id: @game.stadium_id,
                 av_seats: @game.available_seats,
                 game_teams: @game.teams
               }
             },
             status: :created
    else
      render json: @game.errors.full_messages, status: :unprocessable_entity
    end
  end

  def delete; end

  private

  def games_params
    params.require(:game).permit(:date)
  end
end
