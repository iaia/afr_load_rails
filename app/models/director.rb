class Director < ActiveRecord::Base
  has_many :movies, dependent: :destroy
  has_many :tv_programs

  after_initialize do
    self.name ||= "no name"
    self.name_ja ||= "no name"
  end

  def self.add_by_tv_program(program)
    Director.find_or_create_by(name_ja: program.movie_director)
  end
end
