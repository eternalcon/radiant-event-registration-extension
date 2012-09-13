class CreateFreeformRegistrations < ActiveRecord::Migration
  def self.up
    create_table :freeform_registrations do |t|
      t.integer :freeform_id
      t.string :participant_id
      t.timestamps
    end
    
  end

  def self.down
    drop_table :freeform_registrations
  end
end
