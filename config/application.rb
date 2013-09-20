require File.expand_path('../boot', __FILE__)
require 'rails/all'
require 'actionpack/action_caching'
Bundler.require(:default, Rails.env)
Bundler.require(*Rails.groups(assets: %w(development test)))
module Ticketee
  class Application < Rails::Application
  end
end
