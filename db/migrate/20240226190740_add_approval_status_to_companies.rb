class AddApprovalStatusToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :approval_status, :boolean, default: false
  end
end
