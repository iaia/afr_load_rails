module Tweet
  def self.tweet(user, watched_tv)
    begin
      credentials = JSON.parse(user.social_profile.credentials)
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_API_KEY"]
        config.consumer_secret     = ENV["TWITTER_API_SECRET"]
        config.access_token        = credentials["token"]
        config.access_token_secret = credentials["secret"]
      end
      client.update("#{watched_tv.tv_program.title_ja}を見ました https://afr-load.herokuapp.com/")
    rescue Exception => ex
      puts "failed to tweet... #{ex.message}"
    end
  end
end
