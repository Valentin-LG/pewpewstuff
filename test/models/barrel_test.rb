# frozen_string_literal: true

# == Schema Information
#
# Table name: barrels
#
#  id            :bigint           not null, primary key
#  brand         :string
#  compatibility :integer
#  diameter      :float
#  length        :float
#  material      :integer
#  price         :float
#  reference     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class BarrelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
