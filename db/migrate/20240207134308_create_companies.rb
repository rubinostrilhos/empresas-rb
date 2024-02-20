class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :contact_email
      t.string :phone
      t.string :address
      t.string :segment
      t.string :size
      t.boolean :job_offer, default: false
      t.boolean :ruby_stack, default: false

      t.timestamps
    end
  end
end
