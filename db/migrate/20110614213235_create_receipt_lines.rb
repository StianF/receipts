class CreateReceiptLines < ActiveRecord::Migration
  def self.up
    create_table :receipt_lines do |t|
      t.integer :qty
      t.float :price
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :receipt_lines
  end
end
