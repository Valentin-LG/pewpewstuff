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
  belongs_to :user
  belongs_to :personal_replica, optional: true

  has_one :cylinder # through items
  has_one :cylinder_head # through items
  has_one :nozzle # through items
  has_one :piston # through items
  has_one :piston_head # through items
  has_one :spring # through items
  has_one :spring_guide # through items

  validates :reference, presence: true
end
