require "spec_helper"

describe Wrake::Configuration do
  it { should respond_to(:url) }
  it { should respond_to(:url=) }
  it { should respond_to(:username) }
  it { should respond_to(:username=) }
  it { should respond_to(:password) }
  it { should respond_to(:password=) }

  describe ".from_file" do
    it "reads the config params from a file" do
      subject.from_file(Rails.root.join('config/wrake.yml'))
      expect(subject.username).to eq('jondoe')
      expect(subject.password).to eq('secret')
      expect(subject.url).to eq('http://example.com')
    end
  end
end
