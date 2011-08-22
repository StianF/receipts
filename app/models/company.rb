class Company < ActiveRecord::Base
#  attr_accessible :name, :web, :logo
	has_attached_file :logo
	has_many :receipts
end
