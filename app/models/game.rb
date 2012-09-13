class Game < ActiveRecord::Base
  belongs_to :event
  belongs_to :game_block
  
  validates_presence_of :event
  validates_presence_of :game_title
  validates_presence_of :name_of_gamemaster
  validates_presence_of :system
  validates_presence_of :world
  validates_presence_of :game_language
  validates_numericality_of :player_count
  
  after_create :ac_send_notification_email
  
  
  def ac_send_notification_email
  #  GameNotificationMailer.deliver_game_announcements_team_email(self)
  end
end
