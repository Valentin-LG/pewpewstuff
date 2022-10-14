# frozen_string_literal: true

# == Schema Information
#
# Table name: nozzles
#
#  id          :bigint           not null, primary key
#  brand       :string
#  for_replica :string
#  length      :float
#  material    :integer
#  o_ring      :integer
#  price       :float
#  reference   :string
#  weight      :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  gearbox_id  :bigint
#
class Nozzle < ApplicationRecord
  belongs_to :gearbox, optional: true

  enum material: MATERIALS

  validates :reference, presence: true
end
