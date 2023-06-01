class RenameCol < ActiveRecord::Migration[7.0]
  def change
    rename_column :friendships,:sent_by_id,:sender_id
  end
end
