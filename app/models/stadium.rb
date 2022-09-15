class Stadium < ApplicationRecord
  has_many :games
  has_many :reservations
end
