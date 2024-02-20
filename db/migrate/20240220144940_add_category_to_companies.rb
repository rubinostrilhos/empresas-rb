class AddCategoryToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :category, :string
  end
end
