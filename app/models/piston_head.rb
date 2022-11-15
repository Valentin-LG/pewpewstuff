# frozen_string_literal: true

# == Schema Information
#
# Table name: piston_heads
#
#  id         :bigint           not null, primary key
#  brand      :string
#  material   :integer
#  on_bearing :boolean
#  price      :float
#  reference  :string
#  silenced   :boolean
#  weight     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gearbox_id :bigint
#
class PistonHead < ApplicationRecord
  belongs_to :gearbox, optional: true

  enum material: Constants::MATERIALS

  validates :reference, presence: true
end
