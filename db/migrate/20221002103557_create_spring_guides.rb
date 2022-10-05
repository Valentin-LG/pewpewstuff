# frozen_string_literal: true

class CreateSpringGuides < ActiveRecord::Migration[7.0]
  def change
    create_table :spring_guides do |t|
      t.string :brand
      t.string :reference
      t.float :length
      t.boolean :quick_detach
      t.boolean :on_bearing
      t.float :weight
      t.float :price

      t.timestamps
    end
  end
end
