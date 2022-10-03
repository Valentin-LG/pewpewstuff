class CreatePistonHeads < ActiveRecord::Migration[7.0]
  def change
    create_table :piston_heads do |t|
      t.string :brand
      t.string :reference
      t.integer :material
      t.boolean :silenced
      t.boolean :on_bearing
      t.float :weight
      t.float :price

      t.timestamps
    end
  end
end
