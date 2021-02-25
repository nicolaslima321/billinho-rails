class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.string :course_name
      t.integer :institution_id
      t.float :invoice_quantity
      t.integer :student_id
      t.float :total_price
      t.date :expiration_date

      t.timestamps
    end
  end
end
