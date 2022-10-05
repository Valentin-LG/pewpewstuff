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
#
require 'test_helper'

class CylinderHeadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
