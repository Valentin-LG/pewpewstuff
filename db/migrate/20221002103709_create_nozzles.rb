class CreateNozzles < ActiveRecord::Migration[7.0]
  def change
    create_table :nozzles do |t|
      t.string :brand
      t.string :reference
      t.integer :material
      t.integer :o_ring
      t.string :for_replica
      t.float :weight
      t.float :length
      t.float :price

      t.timestamps
    end
  end
end
