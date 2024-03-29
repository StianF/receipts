class CreateReceipts < ActiveRecord::Migration
  def self.up
    create_table :receipts do |t|
      t.string :title
      t.datetime :date
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :receipts
  end
end
