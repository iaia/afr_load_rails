
namespace :get_afr_load_comment_tweet do
    desc "毎日動かして午後ローがある日は"
    task :get_afr_load_comment_tweet => :environment do
        com = CommentGetter.new(DateTime.now, "午後のロードショー", "Twitter")
        p com
    end

    class CommentGetter
        def initialize(now, tv_info_name, provider_name)
            TweetStream.configure do |config|
                config.consumer_key = ENV["API_KEY"]
                config.consumer_secret = ENV["API_SECRET"]
                config.oauth_token = ENV["ACCESS_TOKEN"]
                config.oauth_token_secret = ENV["ACCESS_TOKEN_SECRET"]
                config.auth_method = :oauth
            end
            @client = TweetStream::Client.new
            # ["#午後ロー", "#午後のロードショー", "#午後ﾛｰ", "#午後ロード", "#tvtokyo", "#テレビ東京", "#テレ東"]
            tv_program_info = TvProgramInformation.where(name: tv_info_name).first
            @topics = tv_program_info.topics.pluck(:term)
            @on_air_time = tv_program_info.on_air_minutes
            @provider_id = CommenProvider.where(name: provider_name)
            @tv_id = TvProgram.where(on_air_date: now..(now + Rational(1/24))).first.id
        end

        def get
            EM.run do 
                EM::PeriodicTimer.new(@on_air_time) do
                    EM.stop
                end

                @client.track(topics) do |status|
                    p [@tv_id, @provider_id, status.full_text, status.id, status.user.screen_name, status.created_at.strftime("%Y-%m-%d %X:%M:%S")]
                    begin
                        # save
                    rescue => ex
                        p "failed insert. #{ex.message}"
                    end
                end
            end
        end
    end
end

