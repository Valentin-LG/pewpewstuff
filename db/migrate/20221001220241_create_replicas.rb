class CreateReplicas < ActiveRecord::Migration[7.0]
  def change
    create_table :replicas do |t|
      t.string :brand
      t.string :name
      t.string :reference
      t.integer :category
      t.float :price

      t.timestamps
    end
  end
end
