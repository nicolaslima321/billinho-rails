class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :cnpj
      t.string :kind
      t.string :name

      t.timestamps
    end
  end
end
