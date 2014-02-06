class AddUserIdToMemos < ActiveRecord::Migration
  def change
    add_column :memos, :user_id, :integer
    add_index :memos, :user_id
  end
end
