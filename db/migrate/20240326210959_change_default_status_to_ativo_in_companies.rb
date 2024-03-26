class ChangeDefaultStatusToAtivoInCompanies < ActiveRecord::Migration[7.1]
  def change
    change_column :companies, :status, :string, default: "Ativo"
  end
end
