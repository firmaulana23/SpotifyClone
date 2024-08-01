class CreateLikedSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :liked_songs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
