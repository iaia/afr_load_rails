class Actor < ActiveRecord::Base
  has_many :actor_movie
  has_many :movies, -> { distinct }, through: :actor_movie
  has_many :tv_programs
  has_many :thumbnails, -> { distinct }, class_name: "ActorThumbnail"

  after_initialize do
    self.name ||= "no name"
    self.name_ja ||= "no name"
  end

  def self.add_by_tv_program(program)
    leading_actor =
      Actor.find_or_create_by(name_ja: program.leading_actor)
    supporting_actor =
      Actor.find_or_create_by(name_ja: program.supporting_actor)
    [leading_actor, supporting_actor]
  end
end
