class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.text :info
      t.string :website
      t.string :name
      t.timestamps
    end
  end
end
