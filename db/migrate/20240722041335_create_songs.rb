class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :genre
      t.integer :year
      t.time :duration

      t.timestamps
    end
  end
end
