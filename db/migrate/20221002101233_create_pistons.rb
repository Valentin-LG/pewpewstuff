# frozen_string_literal: true

class CreatePistons < ActiveRecord::Migration[7.0]
  def change
    create_table :pistons do |t|
      t.string :brand
      t.string :reference
      t.integer :teeth_number
      t.integer :teeth_material
      t.integer :material
      t.float :weight
      t.float :price

      t.timestamps
    end
  end
end
