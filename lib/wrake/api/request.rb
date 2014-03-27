require 'httparty'

module Wrake
  class Api
    class Request

      attr_reader :url, :data

      def initialize(url, data = {})
        @url  = url
        @data = data
      end

      def perform
        Response.new(HTTParty.post(url, data))
      end

    end
  end
end
