class AddPhotoToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :photo, :string
  end
end
