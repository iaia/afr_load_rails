require 'rails_helper'

RSpec.describe MovieThumbnailsController, type: :controller do
  let(:valid_movie) do
    create(:movie)
  end

  let(:image_path) { File.join(Rails.root, 'spec/fixtures/images/back_to_the_future.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  describe "POST #create" do
    it "creates a new movie_thumbnail" do
      movie = valid_movie
      expect do
        post :create, params: {movie_id: movie.id, movie_thumbnail: {movie_id: movie.id}, file: image}, format: :json
      end.to change(MovieThumbnail, :count).by(1)
    end
  end
end
