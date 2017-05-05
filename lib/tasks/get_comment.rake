# encoding: utf-8

namespace :get_comment do
    desc "毎日動かして午後ローがある日は"
    task :get_afr_load_comment => :environment do |task, args|
        now = DateTime.now
        now = DateTime.new(2017, 5, 1, 23, 04)
        tv_name = "午後のロードショー"
        provider = "Twitter"
        p args

        com = CommentGetter.new(now, tv_name, provider)
        if com.prepare_ok?
            com.get
        end
    end

    class CommentGetter
        def initialize(now, tv_info_name, provider_name)
            @tv = TvProgram.where(on_air_date: now..(now + Rational(1, 24))).first
            @provider = CommentProvider.where(name: provider_name).first
            if provider_name == "Twitter"
                prepare_twitter(tv_info_name)
            end
        end

        def prepare_twitter(tv_info_name)
            @tv_program_info = TvProgramInfomation.where(name: tv_info_name).first
            @topics = @tv_program_info.topics.pluck(:term)
            @on_air_time = @tv_program_info.on_air_minutes
        end

        def prepare_ok?
            if @topics.nil? or @on_air_time.nil? or @provider.nil? or @tv.nil?
                false
            else
                true
            end
        end

        def get
            EM.run do 

                TweetStream.configure do |config|
                    config.consumer_key = ENV["TWEETSTREAM_API_KEY"]
                    config.consumer_secret = ENV["TWEETSTREAM_API_SECRET"]
                    config.oauth_token = ENV["TWEETSTREAM_ACCESS_TOKEN"]
                    config.oauth_token_secret = ENV["TWEETSTREAM_ACCESS_TOKEN_SECRET"]
                    config.auth_method = :oauth
                end

                client = TweetStream::Client.new
                puts "****** get_afr_load start!"
                puts "#{@tv_program_info.name}: #{@tv.title}(on_air_time:#{@on_air_time}): #{@topics}"
                EM::PeriodicTimer.new(@on_air_time) do
                    puts "****** get_afr_load end!"
                    EM.stop
                end

                client.track(@topics) do |status|
                    p [@tv.id, @provider.id, status.full_text, status.id, status.user.screen_name, status.created_at.strftime("%Y-%m-%d %X:%M:%S")]
                    begin
                        Comment.create(provider_id: @provider.id, comment_id_on_provider: status.id) do |comment|
                            comment.tv_program_id = @tv.id
                            comment.body = status.full_text
                            comment.user_name = status.user.screen_name
                            comment.commented_time = status.created_at.strftime("%Y-%m-%d %X:%M:%S")
                        end
                    rescue => ex
                        p "failed insert. #{ex.message}"
                    end
                end
            end
        end
    end
end

