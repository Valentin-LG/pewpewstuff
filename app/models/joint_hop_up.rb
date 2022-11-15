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
class JointHopUp < ApplicationRecord
  belongs_to :replica, optional: true

  enum compatibility: Constants::CATEGORIES
  enum material: Constants::MATERIALS

  validates :reference, presence: true
end
