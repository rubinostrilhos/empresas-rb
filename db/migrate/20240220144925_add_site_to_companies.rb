class AddSiteToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :site, :string
  end
end
