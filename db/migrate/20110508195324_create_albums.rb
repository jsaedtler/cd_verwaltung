class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.integer :artist_id
      t.timestamps
    end

    add_index :albums, :artist_id

  end

  def self.down
    drop_table :albums
  end
end
