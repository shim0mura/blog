class Contents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :path
      t.string :title
      t.string :title_photo_url
      t.string :text
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
