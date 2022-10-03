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
class SpringGuideSerializer < ActiveModel::Serializer
  attributes :id, :brand, :reference, :length, :quick_detach, :on_bearing, :weight, :price
end
