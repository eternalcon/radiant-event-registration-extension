class Category < ActiveRecord::Base

    # Set up a category tree: each #category can belong to one root category, but have many branch categories
    belongs_to :category
	has_many :categories
    # other resources that will be categorized - many to many relationship for now...
    has_and_belongs_to_many :events
    has_and_belongs_to_many :prices

end
