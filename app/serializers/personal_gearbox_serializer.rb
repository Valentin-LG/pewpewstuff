# == Schema Information
#
# Table name: personal_gearboxes
#
#  id                  :bigint           not null, primary key
#  blowback            :boolean
#  brand               :string
#  price               :float
#  quick_detach        :boolean
#  reference           :string
#  reinfored           :boolean
#  version             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  personal_replica_id :bigint
#  user_id             :bigint
#
class PersonalGearboxSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :brand, :reference, :version, :quick_detach, :blowback, :reinfored, :price, :cylinder_id, :cylinder_head_id, :nozzle_id, :piston_id, :piston_head_id, :spring_id, :spring_guide_id
end
