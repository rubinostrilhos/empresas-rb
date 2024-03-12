class AddColorToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :color, :string
  end
end
