class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.string :name
      t.decimal :price
      t.date :valid_from
      t.date :valid_until
      t.references :category
      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
