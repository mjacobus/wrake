require 'spec_helper'

# TODO: remove 'at_least_once'. In the spec the task is
# run twice for some reason

describe Wrake::TasksController do
  routes { Wrake::Engine.routes }

  describe "GET 'invoke'" do
    it "invokes tasks with no args" do
      expect(TaskTester).to receive(:run)
      post :invoke, task_name: 'wrake_test:simple'
      expect(response).to be_success
    end

    it "invokes tasks with args" do
      expect(TaskTester).to receive(:run).at_least(:once).with('jon', 'doe')
      post :invoke, task_name: 'wrake_test:with_args', args: 'jon doe'
      expect(response).to be_success
    end

  end

end
