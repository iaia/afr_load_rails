# encoding: utf-8

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
    provider :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_API_SECRET"]
end

# failure
OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
