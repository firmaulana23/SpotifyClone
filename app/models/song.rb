class Song < ApplicationRecord
  has_one_attached :audio
  has_one_attached :image

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one :album_song, dependent: :destroy
  has_one :album, through: :album_song
  has_many :liked_songs, dependent: :destroy
  has_many :artist_songs, dependent: :destroy
  has_many :artists, through: :artist_songs
  has_many :playlist_songs
  has_many :playlist, through: :playlist_songs
  has_many :liked_songs

  def should_generate_new_friendly_id?
    title_changed?
  end

  def duration
    return unless audio.attached?

    # Download the audio file to a temporary location
    Tempfile.create([audio.filename.base, audio.filename.extension], binmode: true) do |temp_file|
      temp_file.write(audio.download)
      temp_file.rewind

      # Create an FFmpeg::Movie object with the temp file
      movie = FFMPEG::Movie.new(temp_file.path)
      
      # Return the duration if the movie object is valid
      movie.valid? ? movie.duration : nil
    end
  rescue => e
    Rails.logger.error("Error calculating duration: #{e.message}")
    nil
  end

  def format_duration(seconds)
    minutes = seconds / 60
    seconds = seconds % 60
    format('%02d:%02d', minutes, seconds)
  end
end
