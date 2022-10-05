# frozen_string_literal: true

class CreateHopUpUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :hop_up_units do |t|
      t.string :brand
      t.string :reference
      t.integer :material
      t.string :for_replica
      t.float :weight
      t.float :price

      t.timestamps
    end
  end
end
