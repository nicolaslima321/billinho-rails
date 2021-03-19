class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :enrolment_id
      t.date :expiration_date
      t.float :invoice_value
      t.string :status
      t.index ["enrolment_id"], name: "index_invoices_on_enrolment_id"

      t.timestamps
    end
  end
end
