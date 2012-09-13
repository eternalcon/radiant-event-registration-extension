class FreeformAuthor < ActiveRecord::Base
  belongs_to :freeform
  validates_presence_of :email
end
