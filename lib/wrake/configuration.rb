module Wrake
  class Configuration
    attr_accessor :username, :password, :url

    def from_file(file, env = nil)
      env ||= defined?(Rails) ? Rails.env : 'production'
      config = YAML::load(File.open(file))[env]

      config.each do |key, value|
        send("#{key}=", value)
      end
    end
  end
end
