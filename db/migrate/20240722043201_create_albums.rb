class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.datetime :release_date

      t.timestamps
    end
  end
end
