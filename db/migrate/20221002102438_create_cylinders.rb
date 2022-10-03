class CreateCylinders < ActiveRecord::Migration[7.0]
  def change
    create_table :cylinders do |t|
      t.string :brand
      t.string :reference
      t.integer :material
      t.float :size
      t.float :diameter
      t.float :weigh
      t.boolean :drilled
      t.float :price

      t.timestamps
    end
  end
end
