class Game < ApplicationRecord
  has_many :reservations
  belongs_to :stadium
  has_many :game_teams
  has_many :teams, through: :game_teams

  validates :stadium, :date, :available_seats, presence: true
  validates :available_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
