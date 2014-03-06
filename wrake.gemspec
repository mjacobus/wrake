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

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0.3"
end
