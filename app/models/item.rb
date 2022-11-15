# frozen_string_literal: true

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
class Item < ApplicationRecord
  belongs_to :user, optional: true # remove this optional, item must belong to someone
  belongs_to :personal_replica, optional: true
  belongs_to :personal_gearbox, optional: true

  validates :part_id, presence: true
  validates :part_type, presence: true # TODO: validate naming
end
