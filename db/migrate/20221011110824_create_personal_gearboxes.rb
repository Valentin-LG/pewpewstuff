class CreatePersonalGearboxes < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_gearboxes do |t|
      t.string :brand
      t.string :reference
      t.string :version
      t.boolean :quick_detach
      t.boolean :blowback
      t.boolean :reinfored
      t.float :price
      t.bigint :user_id
      t.bigint :personal_replica_id

      t.timestamps
    end
  end
end
