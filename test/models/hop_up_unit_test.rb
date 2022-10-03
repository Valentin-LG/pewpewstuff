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
require "test_helper"

class HopUpUnitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
