module Wrake
  class Api
    class Response

      def initialize(response)
        @response = response
      end

      def body
        @response.body
      end

      def code
        @response.code
      end

      def message
        @response.message
      end

      def headers
        @response.headers
      end

    end
  end
end
