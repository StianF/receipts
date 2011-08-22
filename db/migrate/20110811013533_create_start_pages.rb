class CreateStartPages < ActiveRecord::Migration
  def self.up
    create_table :start_pages do |t|
      t.integer :role_id
      t.timestamps
    end
  end

  def self.down
    drop_table :start_pages
  end
end
