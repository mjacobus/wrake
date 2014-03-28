require "spec_helper"
require "wrake/command/options"

describe Wrake::Command::Options do
  let(:config_file) { 'some/config.yml' }

  describe "#config_file" do
    it "defaults to the rails application file"

    it "returns the config file" do
      property_matches ['-c', config_file], :config_file, config_file
    end
  end

  describe "#env" do
    it "defaults to production" do
      property_matches [], :env, 'production'
    end

    it "returns the given option" do
      property_matches ['-e', 'development'], :env, 'development'
    end
  end

  describe "#task_name" do
    it "returns the task name" do
      property_matches ['task:name', '-e', 'dev'], :task_name, 'task:name'
    end
  end

  describe "#task_args" do
    it "returns the given arguments" do
      property_matches ['task:name', 'a', 'b', '-e', 'dev'], :task_args, ['a', 'b'] 
      property_matches ['task:name', '-e', 'dev'], :task_args, []
    end
  end

  def property_matches(options = {}, property, value)
    options = build(options)
    expect(options.send(property)).to eq(value)
  end

  def build(options)
    described_class.new(options)
  end
end
