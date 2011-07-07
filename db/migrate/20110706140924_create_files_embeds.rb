class CreateFilesEmbeds < ActiveRecord::Migration
  def self.up
    create_table :files_embeds do |t|
      t.text :code

      t.timestamps
    end
  end

  def self.down
    drop_table :files_embeds
  end
end
