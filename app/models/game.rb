class Game < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations, dependent: :destroy
  has_many :game_teams
  has_many :teams, through: :game_teams, dependent: :destroy
  belongs_to :stadium
end
