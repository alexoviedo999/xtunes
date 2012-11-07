class AddPhotoToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :photo, :string
  end
end
