class Participant < ActiveRecord::Base
  has_many :registrations
  has_many :events, :through => :registrations
  
  validates_presence_of :last_name
  validates_presence_of :first_name
  validates_presence_of :email
  #validates_uniqueness_of :email
  
  #belongs_to :user
  #validates_associated :events
  #validate_presence_of :street, :postcode, :country


end
