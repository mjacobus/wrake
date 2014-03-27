module Wrake
  class Configuration
    attr_accessor :username, :password, :url

    def from_file(file)
      config = YAML::load(File.open(file))[Rails.env]

      config.each do |key, value|
        send("#{key}=", value)
      end
    end
  end
end
