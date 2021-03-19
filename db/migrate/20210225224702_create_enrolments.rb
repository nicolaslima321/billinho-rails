class CreateEnrolments < ActiveRecord::Migration[5.2]
  def change
    create_table :enrolments do |t|
      t.string :course_name
      t.integer :institution_id
      t.float :invoice_quantity
      t.integer :student_id
      t.float :total_price
      t.integer :expiration_day
      t.index ["institution_id"], name: "index_enrolments_on_institution_id"
      t.index ["student_id"], name: "index_enrolments_on_student_id"

      t.timestamps
    end
  end
end
