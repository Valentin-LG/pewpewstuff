# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  comment    :text
#  part_type  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  part_id    :bigint
#  user_id    :bigint
#
require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
