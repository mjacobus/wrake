require 'optparse'

module Wrake
  class Command
    class Options
      class Error < StandardError; end

      attr_reader :config_file, :env, :task_args, :task_name

      def initialize(options = [])
        @env = 'production'
        parse(options)
      end

      private
        def parse(options)
          @parser = OptionParser.new do |opts|
            opts.banner = "Usage: wrake task_name [params] [options]"
            parse_config_file(opts)
            parse_environment(opts)

            opts.on_tail("-h", "--help", "Show this message") do
              puts opts
              exit
            end
          end

          @parser.parse!(options)
          parse_task_name(options)
          parse_task_args(options)
        rescue OptionParser::InvalidOption => e
          raise_error(e.message)
        end

        def raise_error(message)
          raise Error, message + "\n\n#{@parser}"
        end

        def parse_task_name(options)
          @task_name = options.shift
        end

        def parse_task_args(options)
          @task_args = options
        end

        def parse_config_file(opts)
          opts.on('-c', '--config-file CONFIG_FILE', "Set the config file to read from.") do |file|
            @config_file = file
          end
        end

        def parse_environment(opts)
          opts.on('-e', '--env ', "Set the environment. Defaults to 'production'") do |file|
            @env = file
          end
        end
    end
  end
end
