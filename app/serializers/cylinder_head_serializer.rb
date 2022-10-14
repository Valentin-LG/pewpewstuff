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
class CylinderHeadSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :material, :o_ring, :for_replica, :silenced, :weight, :price
end
