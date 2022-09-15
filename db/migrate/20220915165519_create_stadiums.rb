class CreateStadiums < ActiveRecord::Migration[7.0]
  def change
    create_table :stadiums do |t|
      t.string :name
      t.string :country
      t.integer :seats

      t.timestamps
    end
  end
end
