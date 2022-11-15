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
#  replica_id    :bigint
#
class Barrel < ApplicationRecord
  belongs_to :replica, optional: true

  enum compatibility: Constants::CATEGORIES
  enum material: Constants::MATERIALS

  validates :reference, presence: true
end
