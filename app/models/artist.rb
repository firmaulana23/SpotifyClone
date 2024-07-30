class Artist < ApplicationRecord
  has_many :artist_songs, dependent: :destroy
  has_many :songs, through: :artist_songs

  has_one_attached :image
end
