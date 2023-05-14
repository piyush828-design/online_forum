class AddNewCol < ActiveRecord::Migration[7.0]
  def change
    add_column :topics,:category,:string
  end
end
