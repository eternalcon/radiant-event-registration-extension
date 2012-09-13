class UpdateGames < ActiveRecord::Migration
  def self.up
    add_column :games, :game_title, :string
    add_column :games, :game_language, :string
    add_column :games, :player_count, :string
  end
  
  
  def self.down
    remove_column :games, :game_title
    remove_column :games, :player_count
    remove_column :games, :game_language
  end
end