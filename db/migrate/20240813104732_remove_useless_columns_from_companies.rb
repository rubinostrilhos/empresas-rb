class RemoveUselessColumnsFromCompanies < ActiveRecord::Migration[7.2]
  def up
    remove_column :companies, :contact_email
    remove_column :companies, :ruby_stack
    remove_column :companies, :address
    remove_column :companies, :approval_status
    remove_column :companies, :status
    remove_column :companies, :phone
  end

  def down
    add_column :companies, :contact_email, :string
    add_column :companies, :ruby_stack, :boolean, default: false
    add_column :companies, :address, :string
    add_column :companies, :approval_status, :boolean, default: false
    add_column :companies, :status, :string, default: "Ativo"
    add_column :companies, :phone, :string
  end
end
