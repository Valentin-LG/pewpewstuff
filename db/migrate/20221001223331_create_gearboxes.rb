# frozen_string_literal: true

class CreateGearboxes < ActiveRecord::Migration[7.0]
  def change
    create_table :gearboxes do |t|
      t.string :brand
      t.string :reference
      t.string :version
      t.boolean :quick_detach
      t.boolean :blowback
      t.boolean :reinfored
      t.float :price

      t.timestamps
    end
  end
end
