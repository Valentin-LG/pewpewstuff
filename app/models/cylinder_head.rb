# frozen_string_literal: true

# == Schema Information
#
# Table name: cylinder_heads
#
#  id          :bigint           not null, primary key
#  brand       :string
#  for_replica :string
#  material    :integer
#  o_ring      :integer
#  price       :float
#  reference   :string
#  silenced    :boolean
#  weight      :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gearbox_id  :bigint
#
class CylinderHead < ApplicationRecord
  belongs_to :gearbox, optional: true

  enum material: Constants::MATERIALS

  validates :reference, presence: true
end
