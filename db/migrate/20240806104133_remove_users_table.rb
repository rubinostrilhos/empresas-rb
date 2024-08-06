class RemoveUsersTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :favorites
    remove_column :companies, :user_id
    drop_table :votes
    drop_table :users
  end
end
