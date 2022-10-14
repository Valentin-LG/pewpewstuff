class FixRelations < ActiveRecord::Migration[7.0]
  def change
    remove_columns :replicas, :barrel_id, :gearbox_id, :hop_up_unit_id, :joint_hop_up_id
    remove_columns :gearboxes, :cylinder_id, :cylinder_head_id, :nozzle_id, :piston_id, :piston_head_id, :spring_id, :spring_guide_id

    add_column :barrels, :replica_id, :bigint
    add_column :hop_up_units, :replica_id, :bigint
    add_column :joint_hop_ups, :replica_id, :bigint
    add_column :gearboxes, :replica_id, :bigint

    add_column :cylinders, :gearbox_id, :bigint
    add_column :cylinder_heads, :gearbox_id, :bigint
    add_column :nozzles, :gearbox_id, :bigint
    add_column :pistons, :gearbox_id, :bigint
    add_column :piston_heads, :gearbox_id, :bigint
    add_column :springs, :gearbox_id, :bigint
    add_column :spring_guides, :gearbox_id, :bigint

    add_column :items, :personal_replica_id, :bigint
    add_column :items, :personal_gearbox_id, :bigint
  end
end
