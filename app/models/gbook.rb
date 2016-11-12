class Gbook < ActiveRecord::Base
	has_many :categories
	has_many :students
	has_many :assignments
end
