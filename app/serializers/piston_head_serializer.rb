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
#
class PistonHeadSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :material, :silenced, :on_bearing, :weight, :price
end