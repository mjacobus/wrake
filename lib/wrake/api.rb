require 'wrake/api/request'
require 'wrake/api/response'

module Wrake
  class Api

    def initialize(params = { })
      @params = params
    end

    def url
      @params.fetch(:url)
    end

     def invoke_task(task, data = {})
      perform_request(url_for("tasks/#{task}"), data)
    end

    def prepare_data(data)
      { query: data, basic_auth: { username: username, password: password } }
    end

    private

      def perform_request(path, data)
        Request.new(path, prepare_data(data)).perform
      end

      def url_for(path = '/')
        "#{url}/#{path}"
      end

      def params
        @params
      end

      def username
        params[:username]
      end

      def password
        params[:password]
      end
  end
end
