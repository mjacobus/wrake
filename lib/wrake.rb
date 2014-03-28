require "wrake/engine" if defined?(Rails)
require "wrake/api"
require "wrake/configuration"
require "wrake/authorization/access_denied"

module Wrake

  def self.config
    @@config ||= Configuration.new
  end

  def self.configure(&block)
    yield config
  end

  def self.api
    @@api ||= Api.new(
      url: config.url,
      username: config.username,
      password: config.password
    )
  end

end
