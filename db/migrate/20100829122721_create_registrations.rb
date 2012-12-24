class CreateRegistrations < ActiveRecord::Migration
    def self.up
        create_table :registrations do |t|
            t.references    :event
            t.references    :participant
            t.text          :notes
            t.boolean       :shuttle
            t.boolean       :early_arrival
            t.string        :freeform_language
            t.string        :room_choice
            t.timestamps

        end
    end

    def self.down
        drop_table :registrations
    end
end
