class AddAttachmentAvatarToBookmarks < ActiveRecord::Migration
  def self.up
    change_table :bookmarks do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :bookmarks, :avatar
  end
end
