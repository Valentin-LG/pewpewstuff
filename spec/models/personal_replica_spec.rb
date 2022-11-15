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
require 'rails_helper'

RSpec.describe PersonalReplica, type: :model do
  fixtures :users, :replicas, :personal_replicas, :barrels, :hop_up_units, :joint_hop_ups, :gearboxes, :personal_gearboxes, :cylinders, :cylinder_heads, :nozzles, :pistons, :piston_heads

  let(:user) { users(:padme) }
  let(:personal_replica) { personal_replicas(:g36) }
  let(:barrel) { barrels(:specna) }

  # it 'should have valid setter for parts' do
  #   personal_replica.barrel = barrel
  #
  #   p "personal_replica.barrel : #{personal_replica.barrel}"
  #   expect(personal_replica).to be_valid
  #   expect(personal_replica.barrel.class).to equal('Barrel')
  # end
end
