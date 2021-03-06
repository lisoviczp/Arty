class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :comment
      t.date :due_date
      t.decimal :price
      t.integer :artist_id
      t.integer :user_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
