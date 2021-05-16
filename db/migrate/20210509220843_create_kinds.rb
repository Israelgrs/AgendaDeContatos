# frozen_string_literal: true

# Creating the table kinds in Database
class CreateKinds < ActiveRecord::Migration[6.1]
  def change
    create_table :kinds do |t|
      t.string :description

      t.timestamps
    end
  end
end
