class Category < ActiveRecord::Base
	has_many :assignments
	belongs_to :gbook
end
