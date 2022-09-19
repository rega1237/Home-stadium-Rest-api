class Game < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  has_many :game_teams
  has_many :teams, through: :game_teams
  belongs_to :stadium

  validates :stadium, :date, :available_seats, presence: true
  validates :available_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
