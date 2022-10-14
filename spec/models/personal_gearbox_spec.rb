# == Schema Information
#
# Table name: personal_gearboxes
#
#  id                  :bigint           not null, primary key
#  blowback            :boolean
#  brand               :string
#  price               :float
#  quick_detach        :boolean
#  reference           :string
#  reinfored           :boolean
#  version             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  personal_replica_id :bigint
#  user_id             :bigint
#
require 'rails_helper'

RSpec.describe PersonalGearbox, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
