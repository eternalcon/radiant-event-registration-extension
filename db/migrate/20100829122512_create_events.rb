class CreateEvents < ActiveRecord::Migration
    def self.up
        create_table :events do |t|
            t.string :name, :null => false
            t.string :subtitle
            t.boolean :active, :default => false
            t.date :startdate, :null => false
            t.date :enddate, :null => false
            t.timestamps
    end
    
  end

  def self.down
    drop_table :events
  end
end
