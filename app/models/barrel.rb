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
class Barrel < ApplicationRecord
  enum compatibility: CATEGORIES
  enum material: MATERIALS
end