class AddCatCol < ActiveRecord::Migration[7.0]
  def change
    add_reference :topics,:category
  end
end
