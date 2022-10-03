class AddRelations < ActiveRecord::Migration[7.0]
  def change
    add_column :replicas, :gearbox_id, :integer
    add_column :replicas, :barrel_id, :integer
    add_column :replicas, :hop_up_unit_id, :integer
    add_column :replicas, :joint_hop_up_id, :integer

    add_column :gearboxes, :cylinder_id, :integer
    add_column :gearboxes, :cylinder_head_id, :integer
    add_column :gearboxes, :nozzle_id, :integer
    add_column :gearboxes, :piston_id, :integer
    add_column :gearboxes, :piston_head_id, :integer
    add_column :gearboxes, :spring_id, :integer
    add_column :gearboxes, :spring_guide_id, :integer
  end
end
