class AddPaperclipColumnsToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :cover_file_name, :string    # Original filename
    add_column :albums, :cover_content_type, :string # Mime type
    add_column :albums, :cover_file_size, :integer   # File size in bytes
  end

  def self.down
    remove_column :albums, :cover_file_name
    remove_column :albums, :cover_content_type
    remove_column :albums, :cover_file_size
  end
end
