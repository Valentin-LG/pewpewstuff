# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.bigint :user_id
      t.bigint :part_id
      t.string :part_type
      t.text :comment

      t.timestamps
    end
  end
end
