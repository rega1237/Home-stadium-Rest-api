class RemoveCollumnsFromGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :team_a
    remove_column :games, :team_b
  end
end
