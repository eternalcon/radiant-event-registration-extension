class RegistrationShuttleInformations < ActiveRecord::Migration
  def self.up
    add_column :registrations, :shuttle_from_hahn, :boolean
    add_column :registrations, :accomodation_for_thursday, :boolean
  end
  
  
  def self.down
    remove_column :registrations, :shuttle_from_hahn
    remove_column :registrations, :accomodation_for_thursday
  end
end
