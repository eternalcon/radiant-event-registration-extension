class AlterRegistrationAddNotes < ActiveRecord::Migration
  def self.up
    change_table :registrations do |e|
      e.text :notes
      e.boolean :wants_double_room
      e.boolean :wants_tripple_room
    end
    
  end

  def self.down
    remove_column :registrations, :notes
    remove_column :registrations, :wants_double_room
    remove_column :registrations, :wants_tripple_room
  end
end