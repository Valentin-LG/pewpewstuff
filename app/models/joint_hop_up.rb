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
#
class JointHopUp < ApplicationRecord
  enum compatibility: CATEGORIES
  enum material: MATERIALS

  validates :reference, presence: true
end
