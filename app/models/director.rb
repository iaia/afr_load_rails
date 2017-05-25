class Director < ActiveRecord::Base
  has_many :movies, dependent: :destroy
  has_many :tv_programs

  after_initialize do
    self.name ||= "no name"
    self.name_ja ||= "no name"
  end

end
