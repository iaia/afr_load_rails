class Actor < ActiveRecord::Base
  has_many :actor_movie
  has_many :movies, -> { distinct }, through: :actor_movie
  has_many :tv_programs
  has_many :thumbnails, -> { distinct }, class_name: "ActorThumbnail"

  after_initialize do
    self.name ||= "no name"
    self.name_ja ||= "no name"
  end

end
