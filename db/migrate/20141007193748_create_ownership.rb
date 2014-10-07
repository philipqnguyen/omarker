class CreateOwnership < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :user, index: true
      t.references :bookmark, index: true

      t.timestamps
    end
  end
end
