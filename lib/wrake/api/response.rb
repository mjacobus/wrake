module Wrake
  class Api
    class Response

      delegate :body, :code, :message, :message, :headers,
        to: :@httparty_response

      def initialize(httparty_response)
        @httparty_response = httparty_response
      end

    end
  end
end
