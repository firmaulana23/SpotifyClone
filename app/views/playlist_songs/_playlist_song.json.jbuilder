json.extract! playlist_song, :id, :song_id, :playlist_id, :created_at, :updated_at
json.url playlist_song_url(playlist_song, format: :json)
