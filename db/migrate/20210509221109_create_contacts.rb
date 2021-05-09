class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.references :kind, null: false, foreign_key: true
      t.text :rmk

      t.timestamps
    end
  end
end
