require "spec_helper"

describe Wrake, ".config" do

  it "returns configuration" do
    expect(Wrake.config).to be_a(Wrake::Configuration)
    expect(Wrake.config).to eq(Wrake.config)
  end

end

describe Wrake, ".configure" do

  it "yields the configuration" do
    expect do
      Wrake.configure do |config|
        config.username = 'username'
      end
    end.to change { Wrake.config.username }.from('jondoe').to('username')
  end

end

describe Wrake, ".api" do
  subject(:api) { Wrake.api }

  before do
    Wrake.configure do |config|
      config.from_file Rails.root.join('config/wrake.yml')
    end
  end

  it "returns a singleton api with default config" do
    expect(api).to be_a(Wrake::Api)
  end

  it "caches the api" do
    expect(api).to be(Wrake.api)
  end

  it "sets the correct url" do
    expect(api.send(:url)).to eq('http://localhost:3000/wrake')
  end

  it "sets the correct username" do
    expect(api.send(:username)).to eq('jondoe')
  end

  it "sets the correct password" do
    expect(api.send(:password)).to eq('secret')
  end

end
