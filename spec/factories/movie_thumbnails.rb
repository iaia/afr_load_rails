FactoryGirl.define do
  factory :movie_thumbnail, class: MovieThumbnail do
    image Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/images/back_to_the_future.jpg"))
  end
end
