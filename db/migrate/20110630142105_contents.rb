class Contents < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :path
      t.string :title
      t.string :title_photo_url
      t.text :text
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
