# frozen_string_literal: true

# == Schema Information
#
# Table name: personal_replicas
#
#  id         :bigint           not null, primary key
#  brand      :string
#  category   :integer
#  name       :string
#  price      :float
#  reference  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
class PersonalReplica < ApplicationRecord
  belongs_to :user, optional: true # remove optional true
  has_one :personal_gearbox
  has_one :personal_barrel, ->(record) { where("personal_replica_id = :personal_replica_id AND part_type = 'Barrel'", personal_replica_id: record.id) }, class_name: 'Item'
  has_one :personal_hop_up_unit, ->(record) { where("personal_replica_id = :personal_replica_id AND part_type = 'HopUpUnit'", personal_replica_id: record.id) }, class_name: 'Item'
  has_one :personal_joint_hop_up, ->(record) { where("personal_replica_id = :personal_replica_id AND part_type = 'JointHopUp'", personal_replica_id: record.id) }, class_name: 'Item'

  enum category: Constants::CATEGORIES

  validates :name, presence: true

  def gearbox
    personal_gearbox
  end

  def barrel
    Barrel.find(personal_barrel.part_id)
  end

  def hop_up_unit
    HopUpUnit.find(personal_hop_up_unit.part_id)
  end

  def joint_hop_up
    JointHopUp.find(personal_joint_hop_up.part_id)
  end
end
