class CreateSprings < ActiveRecord::Migration[7.0]
  def change
    create_table :springs do |t|
      t.string :brand
      t.string :reference
      t.integer :spires
      t.boolean :linear
      t.float :price

      t.timestamps
    end
  end
end
