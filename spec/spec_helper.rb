ENV["RAILS_ENV"] ||= 'test'

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!('rails')
end

require 'simplecov'
SimpleCov.start 'rails'

require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

if defined?(ActiveRecord::Migration) && ActiveRecord::Migration.respond_to?(:check_pending!)
  ActiveRecord::Migration.check_pending!
end

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end


require "fakeweb"
FakeWeb.register_uri :any, %r[.*?], body: "body"
