class AddStatusToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :status_value, :integer, :default => 10
  end

  def self.down
    remove_column :events, :staus_value
  end
end
