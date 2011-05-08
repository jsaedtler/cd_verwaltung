class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :artists, :user_id
  end

  def self.down
    drop_table :artists
  end
end
