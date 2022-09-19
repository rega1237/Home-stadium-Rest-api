class User < ApplicationRecord
  has_many :reservations
  has_many :games, through: :reservations

  validates :username, presence: true, uniqueness: true
end
