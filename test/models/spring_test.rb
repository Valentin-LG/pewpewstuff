# == Schema Information
#
# Table name: springs
#
#  id         :bigint           not null, primary key
#  brand      :string
#  linear     :boolean
#  price      :float
#  reference  :string
#  spires     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SpringTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
