# frozen_string_literal: true

# == Schema Information
#
# Table name: replicas
#
#  id              :bigint           not null, primary key
#  brand           :string
#  category        :integer
#  name            :string
#  price           :float
#  reference       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  barrel_id       :integer
#  gearbox_id      :integer
#  hop_up_unit_id  :integer
#  joint_hop_up_id :integer
#
require 'test_helper'

class ReplicaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
