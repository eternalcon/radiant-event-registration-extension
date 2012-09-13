class CreateGameBlocks < ActiveRecord::Migration
  def self.up
    create_table :game_blocks, :force => true do |t|
      t.integer :event_id
      t.string :title
      t.string :day
      t.integer :order_value
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
    
  end

  def self.down
    drop_table :game_blocks

  end
end