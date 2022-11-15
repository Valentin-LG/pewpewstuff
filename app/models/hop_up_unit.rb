# frozen_string_literal: true

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
#  replica_id  :bigint
#
class HopUpUnit < ApplicationRecord
  belongs_to :replica, optional: true

  enum material: Constants::MATERIALS

  validates :reference, presence: true
end
