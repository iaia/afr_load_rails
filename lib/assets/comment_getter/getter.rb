module CommentGetter
  class Getter
    attr_reader :on_air_time

    def initialize(tv_info_name)
      tv_program_info = TvProgramInfomation.where(name: tv_info_name).first
      @topics = tv_program_info.topics.pluck(:term)
      @on_air_time = tv_program_info.on_air_minutes
    end
  end
end
