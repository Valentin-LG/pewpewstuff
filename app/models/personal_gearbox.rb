# frozen_string_literal: true

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
class PersonalGearbox < ApplicationRecord
  belongs_to :user, optional: true # remove optional true
  belongs_to :personal_replica, optional: true

  has_one :personal_cylinder, ->(record) { where("personal_gearbox_id = :personal_gearbox_id AND part_type = 'Cylinder'", personal_gearbox_id: record.id) }, class_name: 'Item'
  has_one :personal_cylinder_head, ->(record) { where("personal_gearbox_id = :personal_gearbox_id AND part_type = 'CylinderHead'", personal_gearbox_id: record.id) }, class_name: 'Item'
  has_one :personal_nozzle, ->(record) { where("personal_gearbox_id = :personal_gearbox_id AND part_type = 'Nozzle'", personal_gearbox_id: record.id) }, class_name: 'Item'
  has_one :personal_piston, ->(record) { where("personal_gearbox_id = :personal_gearbox_id AND part_type = 'Piston'", personal_gearbox_id: record.id) }, class_name: 'Item'
  has_one :personal_piston_head, ->(record) { where("personal_gearbox_id = :personal_gearbox_id AND part_type = 'PistonHead'", personal_gearbox_id: record.id) }, class_name: 'Item'
  has_one :personal_spring, ->(record) { where("personal_gearbox_id = :personal_gearbox_id AND part_type = 'Spring'", personal_gearbox_id: record.id) }, class_name: 'Item'
  has_one :personal_spring_guide, ->(record) { where("personal_gearbox_id = :personal_gearbox_id AND part_type = 'SpringGuide'", personal_gearbox_id: record.id) }, class_name: 'Item'

  validates :reference, presence: true

  def cylinder
    Cylinder.find(personal_cylinder.part_id)
  end

  def cylinder_head
    CylinderHead.find(personal_cylinder_head.part_id)
  end

  def nozzle
    Nozzle.find(personal_nozzle.part_id)
  end

  def piston
    Piston.find(personal_piston.part_id)
  end

  def piston_head
    PistonHead.find(personal_piston_head.part_id)
  end

  def spring
    Spring.find(personal_spring.part_id)
  end

  def spring_guide
    SpringGuide.find(personal_spring_guide.part_id)
  end

end
