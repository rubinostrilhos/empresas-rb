class AddStatusToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :status, :string, default: "Inativo"
  end
end
