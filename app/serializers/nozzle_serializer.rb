# frozen_string_literal: true

# == Schema Information
#
# Table name: nozzles
#
#  id          :bigint           not null, primary key
#  brand       :string
#  for_replica :string
#  length      :float
#  material    :integer
#  o_ring      :integer
#  price       :float
#  reference   :string
#  weight      :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gearbox_id  :bigint
#
class NozzleSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :material, :o_ring, :for_replica, :weight, :length, :price
end
