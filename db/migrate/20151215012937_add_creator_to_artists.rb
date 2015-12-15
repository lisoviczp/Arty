class AddCreatorToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :creator, :boolean
  end
end
