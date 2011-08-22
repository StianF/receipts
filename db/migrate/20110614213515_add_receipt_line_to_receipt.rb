class AddReceiptLineToReceipt < ActiveRecord::Migration
  def self.up
		add_column :receipt_lines, :receipt_id, :integer
	end

  def self.down
		remove_column :receipt_lines, :receipt_id
  end
end
