require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pinteres
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
     
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #configuranzo hoa local
    config.time_zone = "America/Santiago"

    #configuracion del rack-attack
    config.middleware.use Rack::Attack

    #configuracion para dar soporte a idiomas
    config.i18n.default_locale= :es
  end
end
