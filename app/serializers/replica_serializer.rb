# frozen_string_literal: true

# == Schema Information
#
# Table name: replicas
#
#  id         :bigint           not null, primary key
#  brand      :string
#  category   :integer
#  name       :string
#  price      :float
#  reference  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ReplicaSerializer < ActiveModel::Serializer
  attributes :id, :name, :reference, :category, :price

  has_one :barrel
  has_one :hop_up_unit
  has_one :joint_hop_up
  has_one :gearbox
end
