class AddApprovalStatusToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :approval_status, :boolean
  end
end
