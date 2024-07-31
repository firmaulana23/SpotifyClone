json.extract! album_song, :id, :song_id, :album_id, :created_at, :updated_at
json.url album_song_url(album_song, format: :json)
