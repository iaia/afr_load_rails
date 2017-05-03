# encoding: utf-8

namespace :get_afr_load_comment_tweet do
    desc "毎日動かして午後ローがある日は"
    task :get_afr_load_comment_tweet => :environment do
        now = DateTime.now
        now = DateTime.new(2017, 5, 1, 23, 04)
        com = CommentGetter.new(now, "午後のロードショー", "Twitter")
        if com.prepare_ok?
            com.get
        end
    end

    class CommentGetter
        def initialize(now, tv_info_name, provider_name)
            # ちょっと早めにタスクを動かす(13:20とか)
            # 午後ローは13:35~なので、13:20~14:20の間で引っかかるのがあるはず
            tv = TvProgram.where(on_air_date: now..(now + Rational(1, 24))).first
            @tv_id = tv.id
            TweetStream.configure do |config|
                config.consumer_key = ENV["API_KEY"]
                config.consumer_secret = ENV["API_SECRET"]
                config.oauth_token = ENV["ACCESS_TOKEN"]
                config.oauth_token_secret = ENV["ACCESS_TOKEN_SECRET"]
                config.auth_method = :oauth
            end
            @client = TweetStream::Client.new
            # ["#午後ロー", "#午後のロードショー", "#午後ﾛｰ", "#午後ロード", "#tvtokyo", "#テレビ東京", "#テレ東"]
            tv_program_info = TvProgramInfomation.where(name: tv_info_name).first
            @topics = tv_program_info.topics.pluck(:term)
            @on_air_time = tv_program_info.on_air_minutes
            @provider_id = CommentProvider.where(name: provider_name)
        end

        def prepare_ok?
            if @client.nil? or @topics.nil? or @on_air_time.nil? or @provider_id.nil? or @tv_id.nil?
                false
            else
                true
            end
        end

        def get
            EM.run do 
                puts "****** get_afr_oad_comment_tweet start!"
                EM::PeriodicTimer.new(@on_air_time) do
                    EM.stop
                end

                @client.track(@topics) do |status|
                    begin
                        p [@tv_id, @provider_id, status.full_text, status.id, status.user.screen_name, status.created_at.strftime("%Y-%m-%d %X:%M:%S")]
                    rescue => ex
                        p "failed insert. #{ex.message}"
                    end
                end
            end
        end
    end
end

