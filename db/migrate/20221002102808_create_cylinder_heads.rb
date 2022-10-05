# frozen_string_literal: true

class CreateCylinderHeads < ActiveRecord::Migration[7.0]
  def change
    create_table :cylinder_heads do |t|
      t.string :brand
      t.string :reference
      t.integer :material
      t.integer :o_ring
      t.string :for_replica
      t.boolean :silenced
      t.float :weight
      t.float :price

      t.timestamps
    end
  end
end
