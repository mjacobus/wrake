require "spec_helper"

describe Wrake::Api::Request do
  describe "#perform" do
    let(:url) { 'http://example.com' }

    let(:args) do  
      {
        basic_auth: { username: 'user',  password: 'secret' },
        args: 'some args'
      }
    end

    subject(:request) { Wrake::Api::Request.new(url, args) }

    it "performs the request" do
      expect(HTTParty).to receive(:post).with(url, args)
      request.perform
    end
  end
end
