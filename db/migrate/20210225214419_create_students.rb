class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :birth_date
      t.string :celphone
      t.string :cpf
      t.string :genre
      t.string :name
      t.string :payment_method

      t.timestamps
    end
  end
end
