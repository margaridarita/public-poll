class ChangeSavesToBookmarks < ActiveRecord::Migration[7.0]
  def change
    rename_table :saves, :bookmarks
  end
end
