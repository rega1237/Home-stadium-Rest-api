class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :stadium
  belongs_to :game
end
