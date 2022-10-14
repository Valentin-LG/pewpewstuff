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
require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create(email: 'test@test.test') }
  let(:nozzle) { Nozzle.create(reference: 'shs p90') }
  let(:item) { Item.new(part_type: 'Nozzle', part_id: nozzle.id, user: user) }

  it 'is valid with valid attributes' do
    expect(item).to be_valid
  end

  # it 'should return part as class' do
  #   expect(item.class).to equal('Nozzle')
  # end
end
