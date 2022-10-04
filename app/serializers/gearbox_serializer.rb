# == Schema Information
#
# Table name: gearboxes
#
#  id               :bigint           not null, primary key
#  blowback         :boolean
#  brand            :string
#  price            :float
#  quick_detach     :boolean
#  reference        :string
#  reinfored        :boolean
#  version          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  cylinder_head_id :integer
#  cylinder_id      :integer
#  nozzle_id        :integer
#  piston_head_id   :integer
#  piston_id        :integer
#  spring_guide_id  :integer
#  spring_id        :integer
#
class GearboxSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :version, :quick_detach, :blowback, :reinfored, :price
end