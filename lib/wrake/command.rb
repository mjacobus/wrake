module Wrake
  class Command
    attr_reader :options

    def initialize(options)
      @options = options
      Wrake.config.from_file(options.config_file, options.env)
    end

    def execute
      Wrake.api.invoke_task(options.task_name, args: options.task_args)
    end
  end
end
