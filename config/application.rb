require_relative 'boot'
require 'rails/all'
require 'sprockets/railtie'
Bundler.require(*Rails.groups)

module Learning
  class Application < Rails::Application
    config.load_defaults 6.0
    config.autoload_paths << Rails.root.join("lib")
    config.assets.initialize_on_precompile = false
  end
end
