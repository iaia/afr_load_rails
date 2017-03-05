json.extract! watched_movie, :id, :created_at, :updated_at
json.url watched_movie_url(watched_movie, format: :json)