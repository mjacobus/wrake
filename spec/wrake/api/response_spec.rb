require "spec_helper"

describe Wrake::Api::Response do
  let(:headers) { Hash.new }

  let(:response) { HTTParty.post('http://example.com', {}) }

  subject do
    Wrake::Api::Response.new(response)
  end

  it "sets the correct response" do
    expect(subject.body).to eq(response.body)
  end

  it "sets the correct code" do
    expect(subject.code).to eq(response.code)
  end

  it "sets the correct message" do
    expect(subject.message).to eq(response.message)
  end

  it "sets the correct headers" do
    expect(subject.headers).to eq(response.headers)
  end
end
