class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :enrollment_id
      t.string :expiration_date
      t.string :invoice_value
      t.string :status

      t.timestamps
    end
  end
end
