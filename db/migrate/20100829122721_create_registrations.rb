class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.references :event
      t.references :participant
      t.string :payment_status
      t.integer :room
      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
