# frozen_string_literal: true

class AddPersonalReplicaService < ApplicationService
  class << self
    def call(user, original_replica)
      @user = user
      original_gearbox = original_replica.gearbox
      personal_replica = PersonalReplica.create!(original_replica.dup.attributes.merge(user: user))
      personal_gearbox = PersonalGearbox.create!(original_gearbox.dup.attributes.except('replica_id').merge({ personal_replica: personal_replica, user: user }))

      add_items(original_replica, original_gearbox, personal_replica, personal_gearbox)

      { status: 201, object: personal_replica }
    end

    private

    def add_items(original_replica, original_gearbox, personal_replica, personal_gearbox)
      Replica.reflect_on_all_associations.each do |reflection|
        if reflection.name == :gearbox
          Gearbox.reflect_on_all_associations.each do |reflection|
            gearbox_original_part = original_gearbox.send(reflection.name)
            next if gearbox_original_part.nil? || reflection.name == :replica

            add_item(gearbox_original_part, personal_gearbox)
          end
        else replica_original_part = original_replica.send(reflection.name)
        next if replica_original_part.nil?

        add_item(replica_original_part, personal_replica)
        end
      end
    end

    def add_item(original_part, personal_part)
      Item.create!(part_type: original_part.class, part_id: original_part.id, "#{personal_part.class.to_s.underscore}": personal_part, user: @user
      )
    end
  end
end
