# frozen_string_literal: true

# == Schema Information
#
# Table name: cylinders
#
#  id         :bigint           not null, primary key
#  brand      :string
#  diameter   :float
#  drilled    :boolean
#  material   :integer
#  price      :float
#  reference  :string
#  size       :float
#  weigh      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  gearbox_id :bigint
#
class Cylinder < ApplicationRecord
  belongs_to :gearbox, optional: true

  enum material: MATERIALS

  validates :reference, presence: true
end
