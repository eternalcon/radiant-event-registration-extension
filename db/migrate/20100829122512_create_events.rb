class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name, :null => false
      t.date :startdate, :null => false
      t.date :enddate, :null => false
      t.timestamps
    end
    
  end

  def self.down
    drop_table :events
  end
end
