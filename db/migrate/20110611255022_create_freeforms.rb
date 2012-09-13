class CreateFreeforms < ActiveRecord::Migration
  def self.up
    create_table :freeforms do |t|
      t.integer :event_id
      t.string :title
      t.text :desc_short
      t.text :desc_long
      t.timestamps
    end
    
  end

  def self.down
    drop_table :events
  end
end
