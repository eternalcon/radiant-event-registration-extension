class CreatePrices < ActiveRecord::Migration
    def self.up
        create_table :prices do |t|
            t.string :name
            t.decimal :price
            t.date :valid_from
            t.date :valid_until
            t.integer :pricable_id
            t.string :pricable_type
            t.timestamps
        end
    end
    def self.down
        drop_table :prices
    end
end
