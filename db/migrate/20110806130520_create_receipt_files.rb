class CreateReceiptFiles < ActiveRecord::Migration
  def self.up
    create_table :receipt_files do |t|
      t.integer :receipt_id
      t.timestamps
    end
  end

  def self.down
    drop_table :receipt_files
  end
end
