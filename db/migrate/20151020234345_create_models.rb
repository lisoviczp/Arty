class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :Artwork
      t.string :name
      t.string :content_type
      t.boolean :collection

      t.timestamps
    end
  end
end
