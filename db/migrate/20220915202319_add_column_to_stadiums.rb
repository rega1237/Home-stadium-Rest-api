class AddColumnToStadiums < ActiveRecord::Migration[7.0]
  def change
    add_column :stadiums, :photo, :string
  end
end
