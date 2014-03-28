$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wrake/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wrake"
  s.version     = Wrake::VERSION
  s.authors     = ["Marcelo Jacobus"]
  s.email       = ["marcelo.jacobus@gmail.com"]
  s.homepage    = "http://github.com/mjacobus/wrake"
  s.summary     = "Web Api for Rake"
  s.description = "Runs rake without having to load the entire rais app"
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.0.0", "<= 5.0.0"
  s.add_dependency "httparty"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "fakeweb"
end
