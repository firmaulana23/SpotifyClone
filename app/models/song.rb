class Song < ApplicationRecord
  has_one :album_songs
  has_one :albums, through: :album_songs
end
