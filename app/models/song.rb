class Song < ApplicationRecord
  has_one :album_songs
  has_one :albums, through: :album_songs
  has_many :artist_songs
  has_many :artists, through: :artist_songs
  has_many :playlist_songs
  has_many :playlist, through: :playlist_songs

end
