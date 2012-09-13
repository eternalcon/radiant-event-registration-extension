class CreateGame < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :event_id
      t.string :name_of_gamemaster
      t.string :system
      t.string :world
      t.text :game_block_id
      t.text :description
      t.timestamps
    end
    
  end

  def self.down
    drop_table :games
  end
end
