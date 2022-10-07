# frozen_string_literal: true

# == Schema Information
#
# Table name: spring_guides
#
#  id           :bigint           not null, primary key
#  brand        :string
#  length       :float
#  on_bearing   :boolean
#  price        :float
#  quick_detach :boolean
#  reference    :string
#  weight       :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class SpringGuide < ApplicationRecord
  validates :reference, presence: true
end
