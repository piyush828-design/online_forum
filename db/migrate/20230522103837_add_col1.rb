class AddCol1 < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments,:user
  end
end
