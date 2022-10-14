# frozen_string_literal: true

# == Schema Information
#
# Table name: joint_hop_ups
#
#  id            :bigint           not null, primary key
#  brand         :string
#  compatibility :integer
#  length        :float
#  material      :integer
#  price         :float
#  reference     :string
#  toughness     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  replica_id    :bigint
#
class JointHopUpSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :material, :length, :toughness, :compatibility, :price
end
