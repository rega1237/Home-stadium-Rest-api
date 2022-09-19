class Stadium < ApplicationRecord
  has_many :games
  has_many :reservations

  validates :name, :country, :seats, :photo, presence: true
  validates :name, uniqueness: true
  validates :seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
