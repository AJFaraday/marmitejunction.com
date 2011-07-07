class CreateJunctionEmbeds < ActiveRecord::Migration
  def self.up
    create_table :junction_embeds do |t|
      t.text :code

      t.timestamps
    end
  end

  def self.down
    drop_table :junction_embeds
  end
end
