class Song < ApplicationRecord
  has_one_attached :file

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one :album_song, dependent: :destroy
  has_one :album, through: :album_songs
  has_many :artist_songs, dependent: :destroy
  has_many :artists, through: :artist_songs
  has_many :playlist_songs
  has_many :playlist, through: :playlist_songs

  def should_generate_new_friendly_id?
    title_changed?
  end
end
