# frozen_string_literal: true

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
#  gearbox_id :bigint
#
class Spring < ApplicationRecord
  belongs_to :gearbox, optional: true

  validates :reference, presence: true
end
