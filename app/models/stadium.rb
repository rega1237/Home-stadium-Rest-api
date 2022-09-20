class Stadium < ApplicationRecord
  has_many :games, dependent: :destroy
end
