class StadiumsSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :seats, :coming_games
  def coming_games
    object.games.map do |game|
      if game.available_seats > 0
        {
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
end

