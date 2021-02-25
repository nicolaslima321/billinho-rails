class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.text :cnpj
      t.text :kind
      t.string :name

      t.timestamps
    end
  end
end
