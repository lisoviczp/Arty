class AddImageColumnsToArtworks < ActiveRecord::Migration
  def up
    add_attachment :artworks, :image
  end

  def down
    remove_attachment :artworks, :image
  end
end
