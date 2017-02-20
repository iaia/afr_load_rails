class TvProgram < ActiveRecord::Base
    belongs_to :director
    belongs_to :movie
    belongs_to :country
    belongs_to :leading_actor, class_name: "Actor"
    belongs_to :supporting_actor, class_name: "Actor"

    after_initialize do 
        build_director() if director.nil?
        build_country() if country.nil?
        build_leading_actor() if leading_actor.nil?
        build_supporting_actor() if supporting_actor.nil?
    end

    def self.add(program, movie)
        tv = TvProgram.find_or_create_by(
            on_air_date: make_date_type(program.on_air_date),
            title: program.title,
            director: movie.director
        ) do |tv|
            tv.title_ja = program.title_ja
            tv.released_year = program.released_year
            tv.country = movie.country
            tv.leading_actor = movie.actors[0]
            tv.supporting_actor = movie.actors[1]
            tv.movie = movie
        end
    end

    def self.make_date_type(on_air_date)
        # 月/日[曜日]の形
        # とりあえず今月の+-1ヶ月分しか見えないはず
        # 今月の-+=で年月日は分かる
        now = Time.now
        on_air_time = parse_on_air_date(now.year, on_air_date)

        if (on_air_time - now).to_i > 6 * 31 * 24 * 60 * 60
            on_air_time.year - 1
        elsif (on_air_time - now).to_i < -1 * 6 * 31 * 24 * 60 * 60
            on_air_time.year + 1
        else
            on_air_time
        end
    end

    def self.parse_on_air_date(year, on_air_date)
        on_air_month = on_air_date.match(/(.*)\//)[1]
        on_air_day = on_air_date.match(/.*\/(.*)\[.*\]/)[1]
        Time.local(year, on_air_month, on_air_day)
    end

    def self.get_by(year = nil, month = nil)
        date = make_year_and_month(year, month)
        TvProgram.where(on_air_date: date.beginning_of_month.. date.end_of_month)
    end

    def self.make_year_and_month(year, month)
        year = check_year(year)
        month = check_month(month)
        if year and month
            Date.new(year, month, 1)
        else
            Date.today
        end
    end

    def self.check_year(year)
        if year.to_i > 2000 and year.to_i < 2100
            year.to_i
        end
    rescue
    end

    def self.check_month(month)
        if month.to_i >= 1 and month.to_i <= 12
            month = month.to_i
        end
    rescue
    end

    def start_time
        self.on_air_date
    end
end
