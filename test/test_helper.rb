ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  if Rails.env.development? or Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
          provider: 'twitter',
          uid: '123545',
          credentials: "credentials",
          info: {
              email: "iaia@example.com",
              name: "iaia",
              nickname: "iaia",
              description: "setumei",
              urls: {public_profile: "example@exampl.com", Website: "exampl.com"},
              location: "tokyo"
          },
          extra: {raw_info: "info"}
      })
  end
end

