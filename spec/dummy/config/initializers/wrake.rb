Wrake.configure do |config|
  # config.authorization_class = 'Wrake::Authorization::BasicAuth'
  config.from_file Rails.root.join('config/wrake.yml')
end
