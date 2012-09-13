class CreateFreeformAuthors < ActiveRecord::Migration
  def self.up
    create_table :freeform_authors, :force => true do |t|
      t.integer :freeform_id
      t.string :email
      t.timestamps
    end
  end
  
  
  def self.down
    drop_table :freeform_authors    
  end
end