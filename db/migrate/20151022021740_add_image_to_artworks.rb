class AddImageToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :image, :attachment
  end
end
