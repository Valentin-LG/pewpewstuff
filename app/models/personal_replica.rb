# frozen_string_literal: true

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
class PersonalReplica < ApplicationRecord
  belongs_to :user, optional: true # remove optional true
  has_one :barrel, class_name: 'Item', foreign_key: :part_id, autosave: true

  enum category: CATEGORIES

  validates :name, presence: true

  def barrel=(barrel)
    Item.create(part_type: barrel.class, part_id: barrel.id, personal_replica_id: self.id)
  end
end
