class AddCollumnToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :available_seats, :integer
  end
end
