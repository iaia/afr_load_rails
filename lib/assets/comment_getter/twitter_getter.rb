require_relative "getter"
require_relative "status"

module CommentGetter
  class TwitterGetter < Getter
    attr_accessor :client
    def initialize(tv_info_name)
      super
    end

    def self.create_client(tv_info_name)
      tw = self.new(tv_info_name)
      TweetStream.configure do |config|
        config.consumer_key = ENV["TWEETSTREAM_API_KEY"]
        config.consumer_secret = ENV["TWEETSTREAM_API_SECRET"]
        config.oauth_token = ENV["TWEETSTREAM_ACCESS_TOKEN"]
        config.oauth_token_secret = ENV["TWEETSTREAM_ACCESS_TOKEN_SECRET"]
        config.auth_method = :oauth
      end

      tw.client = TweetStream::Client.new
      tw
    end

    def get
      client.track(@topics) do |status|
        status = Status.new({
          id_on_provider: status.id,
          body: status.full_text,
          user_name: status.user.screen_name,
          commented_time: status.created_at}
        )
        yield status
      end
    end
  end
end
