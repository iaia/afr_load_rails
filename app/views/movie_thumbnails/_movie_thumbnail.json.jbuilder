json.extract! movie_thumbnail, :id, :movie_id, :path, :file_size, :caption, :view_status, :status, :removed, :created_at, :updated_at
json.url movie_thumbnail_url(movie_thumbnail, format: :json)