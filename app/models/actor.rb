class Actor < ActiveRecord::Base
    has_many :actor_movie
    has_many :movies, -> {distinct}, through: :actor_movie
    has_many :tv_programs

    after_initialize do
        name ||= "no name"
        name_ja ||= "no name"
    end

    def self.add_by_tv_program(program)
        leading_actor = Actor.find_or_create_by(name_ja: program.leading_actor)
        supporting_actor = Actor.find_or_create_by(name_ja: program.supporting_actor)
        [leading_actor, supporting_actor]
    end
end
