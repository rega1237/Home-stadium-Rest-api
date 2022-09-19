class ReservationsSerializer < ActiveModel::Serializer
  attributes :id, :reserved_seats, :reserved_game
  def reserved_game
    {
      teams: object.game.teams.map do |team|
        {
          name: team.name,
          flag: team.flag
        }
      end,
      date: object.game.date,
      stadium: object.game.stadium.name
    }
  end
end
