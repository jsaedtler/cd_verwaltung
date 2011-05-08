class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :title
      t.integer :duration
      t.integer :album_id

      t.timestamps
    end
    add_index :tracks, :album_id
  end

  def self.down
    drop_table :tracks
  end
end
