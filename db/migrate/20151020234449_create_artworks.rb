class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :content_type
      t.string :collection_boolean
      t.text :description

      t.timestamps
    end
  end
end
