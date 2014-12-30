class Registration < ActiveRecord::Base
  belongs_to :event
  belongs_to :participant

  validates_presence_of :event
  validates_presence_of :participant
  validates_numericality_of :year_of_birth, :allow_nil => true

  FREEFORM_LANG_SKILLS =  {"eng" => "English", "ger" => "German", "eng+ger" => "English + German"}
end
