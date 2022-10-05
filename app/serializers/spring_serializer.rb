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
#
class SpringSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :spires, :linear, :price
end
