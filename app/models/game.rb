class Game < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :game_teams
  has_many :teams, through: :game_teams
  belongs_to :stadium
end
