class AddCategoryToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :status, :string
  end
end
