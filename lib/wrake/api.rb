module Wrake
  class Api

    def initialize(params = { })
      @params = params
    end

    def url
      @params.fetch(:url)
    end

    private
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
