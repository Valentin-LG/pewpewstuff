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
class Replica < ApplicationRecord
  has_one :gearbox
  has_one :barrel
  has_one :hop_up_unit
  has_one :joint_hop_up

  enum category: CATEGORIES
end
