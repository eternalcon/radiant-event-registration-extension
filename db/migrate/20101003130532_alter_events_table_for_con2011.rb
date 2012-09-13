class AlterEventsTableForCon2011 < ActiveRecord::Migration
  def self.up
    change_table :events do |e|
      e.string :subtitle
      e.boolean :active, :default => false
    end
    
    Event.create(:name => "The Eternal Convention", :startdate => Date.new(y=2013,m=05,d=17), :enddate => Date.new(y=2013,m=05,d=20), :active => true, :subtitle => "The Eternal CONclave")
  end

  def self.down
    remove_column :events, :subtitle
    remove_column :events, :active
  end
end