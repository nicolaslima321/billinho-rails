class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :enrollment_id
      t.date :expiration_date
      t.float :invoice_value
      t.string :status

      t.timestamps
    end
  end
end
