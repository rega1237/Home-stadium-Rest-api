class StadiumsSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :seats, :coming_games
  def coming_games
    object.games.map do |game|
      {
        teams: game.teams.map do |team|
          {
            name: team.name,
            flag: team.flag
          }
        end,
        date: game.date
      }
    end
  end
end
