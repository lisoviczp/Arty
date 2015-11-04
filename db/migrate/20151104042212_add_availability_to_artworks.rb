class AddAvailabilityToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :availability, :boolean
  end
end
