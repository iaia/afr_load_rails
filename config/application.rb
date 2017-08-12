require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load unless Rails.env.production?

module AfrLoadRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = "Tokyo"
    config.beginning_of_week = :sunday
    config.i18n.default_locale = :ja
    unless Rails.env.production?
      config.web_console.development_only = false
    end

    config.generators do |g|
      g.template_engine :slim
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
