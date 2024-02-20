class AddUfToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :uf, :string
  end
end
