require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DockerExample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.log_level = :debug

    zipkin_config = {
      service_name: 'docker-rails-example',
      service_port: 3000,
      json_api_host: 'http://zipkin:9411',
      sample_rate: 1,
      log_tracing: true
    }

    #config.zipkin_tracer = zipkin_config
    config.middleware.use ZipkinTracer::RackHandler, zipkin_config
  end
end
