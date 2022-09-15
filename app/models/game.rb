class Game < ApplicationRecord
  has_many :reservations
  belongs_to :stadium
end
