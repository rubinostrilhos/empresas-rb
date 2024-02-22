class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :celular, :string
    add_column :users, :stack, :string
    add_column :users, :employed, :boolean
    add_column :users, :linkedin, :string
  end
end
