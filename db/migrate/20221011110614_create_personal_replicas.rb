class CreatePersonalReplicas < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_replicas do |t|
      t.string :brand
      t.string :name
      t.string :reference
      t.integer :category
      t.float :price
      t.bigint :user_id

      t.timestamps
    end
  end
end
