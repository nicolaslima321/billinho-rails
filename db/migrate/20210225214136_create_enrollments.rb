class CreateEnrollments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrollments do |t|
      t.string :course_name
      t.string :institution_id
      t.string :invoice_quantity
      t.string :student_id
      t.string :total_price

      t.timestamps
    end
  end
end
