class AddCompanyToReceipts < ActiveRecord::Migration
  def self.up
    add_column :receipts, :company_id, :integer
  end

  def self.down
    remove_column :receipts, :company_id
  end
end
