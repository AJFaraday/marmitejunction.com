class CreateFailedVisits < ActiveRecord::Migration
  def self.up
    create_table :failed_visits do |t|
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :failed_visits
  end
end
