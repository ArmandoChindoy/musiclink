json.extract! song, :id, :title, :description, :author, :playlist_id, :created_at, :updated_at
json.url song_url(song, format: :json)
