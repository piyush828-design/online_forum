class AddApprovCol < ActiveRecord::Migration[7.0]
  def change
    add_column :topics,:approved,:boolean
  end
end
