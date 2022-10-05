# frozen_string_literal: true

# == Schema Information
#
# Table name: hop_up_units
#
#  id          :bigint           not null, primary key
#  brand       :string
#  for_replica :string
#  material    :integer
#  price       :float
#  reference   :string
#  weight      :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class HopUpUnitSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :material, :for_replica, :weight, :price
end
