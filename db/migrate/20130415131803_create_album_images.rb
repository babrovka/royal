class CreateAlbumImages < ActiveRecord::Migration
  def change
    create_table :album_images do |t|
      t.string :title
      t.attachment :image
      t.integer :album_id
      t.timestamps
    end
  end
end
