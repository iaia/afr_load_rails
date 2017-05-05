class Country < ActiveRecord::Base
  has_many :movies
  has_many :tv_programs

  after_initialize do
    self.name ||= "no name"
  end

  def self.add_by_tv_program(program)
    Country.find_or_create_by(name: program.released_country)
  end
end
