json.extract! artist_song, :id, :artist_id, :song_id, :created_at, :updated_at
json.url artist_song_url(artist_song, format: :json)
