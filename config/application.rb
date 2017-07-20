require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Oqtaconteseno
  class Application < Rails::Application

    config.to_prepare do
      Devise::SessionsController.layout 'admin_lte_2_login'
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Brasilia'
    config.active_record.default_timezone = :local

    config.i18n.default_locale = :pt_BR

    config.action_dispatch.default_headers.merge!({'Access-Control-Allow-Origin' => '*', 'Access-Control-Request-Method' => '*'})
  end
end
