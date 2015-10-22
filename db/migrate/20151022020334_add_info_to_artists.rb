class AddInfoToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :artist_id, :integer
    add_column :artists, :first_name, :string
    add_column :artists, :last_name, :string
    add_column :artists, :city, :string
    add_column :artists, :artist_type, :string
    add_column :artists, :description, :text
  end
end
