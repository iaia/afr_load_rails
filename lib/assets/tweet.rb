module Tweet
  def self.tweet(user, watched_tv)
    return if user.setting.nil?
    return unless user.setting.is_tweet?
    begin
      credentials = JSON.parse(user.social_profile.credentials)
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_API_KEY"]
        config.consumer_secret     = ENV["TWITTER_API_SECRET"]
        config.access_token        = credentials["token"]
        config.access_token_secret = credentials["secret"]
      end
      client.update("#{watched_tv.tv_program.title_ja}を見ました #午後ロー via: https://afr-load.herokuapp.com/ ")
    rescue Exception => ex
      puts "failed to tweet... #{ex.message}"
    end
  end
end
