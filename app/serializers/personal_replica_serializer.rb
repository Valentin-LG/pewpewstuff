# == Schema Information
#
# Table name: personal_replicas
#
#  id         :bigint           not null, primary key
#  brand      :string
#  category   :integer
#  name       :string
#  price      :float
#  reference  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
class PersonalReplicaSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :brand, :name, :reference, :category, :price, :barrel_id, :hop_up_unit_id, :joint_hop_up_id, :personal_gearbox_id
end
