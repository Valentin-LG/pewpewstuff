# frozen_string_literal: true

require 'rails_helper'
require 'add_personal_replica_service'

RSpec.describe AddPersonalReplicaService, type: :service do
  fixtures :users, :replicas, :personal_replicas, :barrels, :hop_up_units, :joint_hop_ups, :gearboxes, :personal_gearboxes, :cylinders, :cylinder_heads, :nozzles, :pistons, :piston_heads, :springs, :spring_guides

  let(:user) { users(:padme) }
  let(:personal_replica) { personal_replicas(:g36) }
  let(:barrel) { barrels(:specna) }

  it 'should take replica as input and return full personal_replica' do
    service = AddPersonalReplicaService.call(user, replicas(:g36))

    expect(service[:status]).to equal(201)
    expect(service[:object]).to be_a(PersonalReplica)
    expect(service[:object].barrel).to be_a(Barrel)
    expect(service[:object].hop_up_unit).to be_a(HopUpUnit)
    expect(service[:object].joint_hop_up).to be_a(JointHopUp)
    expect(service[:object].gearbox).to be_a(PersonalGearbox)
    expect(service[:object].gearbox.cylinder).to be_a(Cylinder)
    expect(service[:object].gearbox.cylinder_head).to be_a(CylinderHead)
    expect(service[:object].gearbox.piston).to be_a(Piston)
    expect(service[:object].gearbox.piston_head).to be_a(PistonHead)
    expect(service[:object].gearbox.spring).to be_a(Spring)
    expect(service[:object].gearbox.spring_guide).to be_a(SpringGuide)
    expect(service[:object].gearbox.nozzle).to be_a(Nozzle)
    expect(service[:object].user).to equal(user)
    expect(service[:object].gearbox.user).to equal(user)
  end
end
