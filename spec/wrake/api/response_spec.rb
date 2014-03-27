require "spec_helper"

describe Wrake::Api::Response do
  let(:headers) { Hash.new }
  let(:httparty_response) do
    double(body: 'body', code: 'code', message: 'message', headers: headers)
  end

  subject do
    Wrake::Api::Response.new(httparty_response)
  end

  it "sets the correct response" do
    expect(subject.body).to eq(httparty_response.body)
  end

  it "sets the correct code" do
    expect(subject.code).to eq(httparty_response.code)
  end

  it "sets the correct message" do
    expect(subject.message).to eq(httparty_response.message)
  end

  it "sets the correct headers" do
    expect(subject.headers).to eq(httparty_response.headers)
  end
end
