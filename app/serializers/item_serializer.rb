# == Schema Information
#
# Table name: items
#
#  id                  :bigint           not null, primary key
#  comment             :text
#  part_type           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  part_id             :bigint
#  personal_gearbox_id :bigint
#  personal_replica_id :bigint
#  user_id             :bigint
#
class ItemSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :part_id, :part_type, :comment
end
