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
require 'test_helper'

class JointHopUpTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
