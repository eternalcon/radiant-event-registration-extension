class CreateParticipants < ActiveRecord::Migration
  def self.up
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street
      t.string :postcode
      t.string :city
      t.string :country
      t.text :notes
      t.boolean :newsletter
      t.timestamps
    end
  end

  def self.down
    drop_table :participants
  end
end
