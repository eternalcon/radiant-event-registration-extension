class CreateGame < ActiveRecord::Migration
    def self.up
        create_table :games do |t|
            t.string :game_title
            t.string :game_language
            t.string :player_count #string? Shouldn't this be integer?
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
