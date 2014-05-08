class AddPostedToMemos < ActiveRecord::Migration
  def change
      add_column :memos, :posted, :boolean
  end
end
