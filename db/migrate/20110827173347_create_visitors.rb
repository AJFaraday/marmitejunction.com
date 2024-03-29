class CreateVisitors < ActiveRecord::Migration
  def self.up
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.text :message
      t.boolean :reported

      t.timestamps
    end
  end

  def self.down
    drop_table :visitors
  end
end
