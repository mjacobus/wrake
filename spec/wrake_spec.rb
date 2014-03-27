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
