class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.date :birth_date
      t.string :celphone
      t.string :cpf
      t.string :genre
      t.string :name
      t.string :payment_method

      t.timestamps
    end

    add_index :students, :name, unique: true
    add_index :students, :cpf, unique: true
  end
end
