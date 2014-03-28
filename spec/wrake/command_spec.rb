require "spec_helper"
require "wrake/command"

describe Wrake::Command, '#perform' do
  subject do
    config = double(config_file: Rails.root.join('config/wrake.yml'), env: 'test', task_args: [], task_name: 'task_name')
    Wrake::Command.new(config)
  end

  it "returns a response" do
    expect(subject.execute).to be_a(Wrake::Api::Response)
    expect(subject.execute.body).to eq('body')
  end
end
