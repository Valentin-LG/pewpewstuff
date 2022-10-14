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
class PistonSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :teeth_number, :teeth_material, :material, :weight, :price
end
