# frozen_string_literal: true

# == Schema Information
#
# Table name: gearboxes
#
#  id           :bigint           not null, primary key
#  blowback     :boolean
#  brand        :string
#  price        :float
#  quick_detach :boolean
#  reference    :string
#  reinfored    :boolean
#  version      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  replica_id   :bigint
#
class GearboxSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :version, :quick_detach, :blowback, :reinfored, :price

  has_one :cylinder
  has_one :cylinder_head
  has_one :nozzle
  has_one :piston
  has_one :piston_head
  has_one :spring
  has_one :spring_guide
end
