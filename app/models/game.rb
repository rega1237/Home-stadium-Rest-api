class Game < ApplicationRecord
  has_many :reservations
  belongs_to :stadium
  has_many :game_teams
  has_many :teams, through: :game_teams
end
