class Freeform < ActiveRecord::Base
  belongs_to :event
  has_many :freeform_registrations
  has_many :freeform_authors
  
  validates_presence_of :title
  validates_presence_of :desc_short
  validates_presence_of :desc_long
end
