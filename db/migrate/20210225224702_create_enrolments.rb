class CreateEnrolments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrolments do |t|
      t.string :course_name
      t.integer :institution_id
      t.float :invoice_quantity
      t.integer :student_id
      t.float :total_price
      t.integer :expiration_day

      t.timestamps
    end
  end
end
