module CommentGetter
  class Getter
    attr_reader :on_air_time, :oa_start, :oa_end

    def initialize(tv_info_name, tv)
      tv_program_info = TvProgramInfomation.where(name: tv_info_name).first
      @topics = tv_program_info.topics.pluck(:term)
      @oa_start = tv.on_air_start
      @oa_end = tv.on_air_end
      @on_air_time = ((@oa_end - @oa_start) / 60).to_i
    end
  end
end
