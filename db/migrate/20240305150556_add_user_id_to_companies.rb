class AddUserIdToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_reference :companies, :user, null: true, foreign_key: true
  end
end
