class CreateEventsPrices < ActiveRecord::Migration
  def self.up
    create_table :events_prices, :id => false do |t|
      t.references :event
      t.references :price
    end
  end

  def self.down
    drop_table :events_prices
  end
end
