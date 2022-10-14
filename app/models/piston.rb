# frozen_string_literal: true

# == Schema Information
#
# Table name: pistons
#
#  id             :bigint           not null, primary key
#  brand          :string
#  material       :integer
#  price          :float
#  reference      :string
#  teeth_material :integer
#  teeth_number   :integer
#  weight         :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  gearbox_id     :bigint
#
class Piston < ApplicationRecord
  belongs_to :gearbox, optional: true

  enum material: MATERIALS
  enum teeth_material: MATERIALS, _prefix: true

  validates :reference, presence: true
end
