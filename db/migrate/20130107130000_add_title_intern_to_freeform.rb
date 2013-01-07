# rake radiant:extensions:event_registration:migrate

class AddTitleInternToFreeform< ActiveRecord::Migration
  def self.up
    add_column :freeforms, :title_intern, :string
  end

  def self.down
    remove_column :freeforms, :title_intern
  end
end
