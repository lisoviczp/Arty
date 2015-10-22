class AddImageColumnsToArtists < ActiveRecord::Migration
  def up
    add_attachment :artists, :image
  end

  def down
    remove_attachment :artists, :image
  end
end
