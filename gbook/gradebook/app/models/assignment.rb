class Assignment < ActiveRecord::Base
	has_many :grades
	belongs_to  :category
	belongs_to :gbook
end
