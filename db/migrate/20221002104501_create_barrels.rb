class CreateBarrels < ActiveRecord::Migration[7.0]
  def change
    create_table :barrels do |t|
      t.string :brand
      t.string :reference
      t.integer :material
      t.float :length
      t.float :diameter
      t.integer :compatibility
      t.float :price

      t.timestamps
    end
  end
end
