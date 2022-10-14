# frozen_string_literal: true

# == Schema Information
#
# Table name: gearboxes
#
#  id           :bigint           not null, primary key
#  blowback     :boolean
#  brand        :string
#  price        :float
#  quick_detach :boolean
#  reference    :string
#  reinfored    :boolean
#  version      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  replica_id   :bigint
#
require 'test_helper'

class GearboxTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
