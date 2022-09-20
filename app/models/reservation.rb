class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :game

  after_save :update_avilable_seats
  after_destroy :update_avilable_seats_destroy

  private

  def update_avilable_seats
    game = Game.find(self.game_id)
    game.update(available_seats: game.available_seats - self.reserved_seats)
  end

  def update_avilable_seats_destroy
    game = Game.find(self.game_id)
    game.update(available_seats: game.available_seats + self.reserved_seats)
  end
end
