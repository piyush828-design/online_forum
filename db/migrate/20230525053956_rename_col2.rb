class RenameCol2 < ActiveRecord::Migration[7.0]
  def change
    rename_column :friendships,:sent_to_id,:receiver_id
  end
end
