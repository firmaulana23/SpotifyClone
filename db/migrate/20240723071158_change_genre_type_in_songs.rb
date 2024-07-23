class ChangeGenreTypeInSongs < ActiveRecord::Migration[6.1]
  def up
    change_column :songs, :genre, :text
  end

  def down
    change_column :songs, :genre, :integer
  end
end