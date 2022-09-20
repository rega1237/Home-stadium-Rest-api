class StadiumsSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :seats, :photo, :coming_games
  def coming_games
    object.games.map do |game|
      next unless game.available_seats.positive?

      {
        game_id: game.id,
        teams: game.teams.map do |team|
          {
            name: team.name,
            flag: team.flag
          }
        end,
        date: game.date,
        aviable_seats: game.available_seats
      }
    end
  end
end
