class ReceiptFile < ActiveRecord::Base
  belongs_to :receipt
  
  has_attached_file :file, :url => "/receipts/:id.:extension",
                    :path => ":rails_root/public/receipts/:id.:extension"
end
