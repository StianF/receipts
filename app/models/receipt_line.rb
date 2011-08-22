class ReceiptLine < ActiveRecord::Base
	belongs_to :receipt

  validates_presence_of :title, :price, :qty
end
