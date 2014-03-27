class Wrake::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def copy_initializer
    template "initializer.rb", "config/initializers/wrake.rb"
  end

  def copy_config_file
    template "wrake.yml", "config/wrake.yml"
  end

end
