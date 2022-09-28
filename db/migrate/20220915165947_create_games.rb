class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :team_a
      t.string :team_b
      t.datetime :date
      t.references :stadium, null: false, foreign_key: { to_table: :stadiums}

      t.timestamps
    end
  end
end
