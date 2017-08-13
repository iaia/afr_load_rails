class MovieThumbnail < ApplicationRecord
  belongs_to :movie
  mount_uploader :image, ImageUploader
end
