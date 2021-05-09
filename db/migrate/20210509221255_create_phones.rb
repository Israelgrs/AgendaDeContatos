class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :Phone
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
