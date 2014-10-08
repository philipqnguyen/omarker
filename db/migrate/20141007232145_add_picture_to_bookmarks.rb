class AddPictureToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :picture, :string
  end
end
