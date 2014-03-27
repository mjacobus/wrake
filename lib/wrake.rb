require "wrake/engine"
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

end
