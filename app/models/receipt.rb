class Receipt < ActiveRecord::Base
#  attr_accessible :title, :date
	has_many :receipt_lines, :dependent => :destroy
  has_many :receipt_files, :dependent => :destroy
    
  belongs_to :company
  belongs_to :user

  accepts_nested_attributes_for :receipt_lines, :allow_destroy => true
  accepts_nested_attributes_for :receipt_files, :allow_destroy => true
  
  validates_presence_of :date, :title, :company_id
end
