class Album < ApplicationRecord
  has_many :album_songs , dependent: :destroy
  has_many :songs, through: :album_songs

  has_one_attached :image
end
