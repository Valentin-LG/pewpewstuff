# frozen_string_literal: true

class CreateJointHopUps < ActiveRecord::Migration[7.0]
  def change
    create_table :joint_hop_ups do |t|
      t.string :brand
      t.string :reference
      t.integer :material
      t.float :length
      t.integer :toughness
      t.integer :compatibility
      t.float :price

      t.timestamps
    end
  end
end
