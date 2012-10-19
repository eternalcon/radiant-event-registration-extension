class Category < ActiveRecord::Base

    # make categories polymorphic and self-referential
    belongs_to :categorizable, polymorphic => true
	has_many :categories, as => :categorizable

end
