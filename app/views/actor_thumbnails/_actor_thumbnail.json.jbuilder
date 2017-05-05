json.extract! actor_thumbnail, :id, :actor_id, :path, :file_size, :caption, :view_status, :status, :removed, :created_at, :updated_at
json.url actor_thumbnail_url(actor_thumbnail, format: :json)
