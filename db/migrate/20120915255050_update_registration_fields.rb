class UpdateRegistrationFields < ActiveRecord::Migration
  def self.up
    add_column :registrations, :nickname, :string
    add_column :registrations, :year_of_birth, :integer
    add_column :registrations, :room_i_dont_care, :boolean
    add_column :registrations, :room_family_room, :boolean
    add_column :registrations, :room_party_room, :boolean
    add_column :registrations, :room_pay_smaller_room, :boolean
    add_column :registrations, :freeform_language_skill, :string
  end
  
  
  def self.down
    remove_column :registrations, :nickname
    remove_column :registrations, :year_of_birth
    remove_column :registrations, :room_i_dont_care
    remove_column :registrations, :room_family_room
    remove_column :registrations, :room_party_room
    remove_column :registrations, :room_pay_smaller_room
    remove_column :registrations, :freeform_language_skill
  end
end
