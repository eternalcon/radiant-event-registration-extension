class UpdateRegistrationFields < ActiveRecord::Migration
  def self.up
    add_column :registrations, :freeform_skill_value, :string
  end


  def self.down
    remove_column :registrations, :freeform_skill_value
  end
end
