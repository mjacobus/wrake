require 'spec_helper'

# TODO: remove 'at_least_once'. In the spec the task is
# run twice for some reason

describe Wrake::TasksController do
  include AuthHelper

  routes { Wrake::Engine.routes }

  describe "GET 'invoke'" do
    context "when authorized" do
      before { http_login }

      it "invokes tasks with no args" do
        expect(TaskTester).to receive(:run)
        post :invoke, task_name: 'wrake_test:simple'
        expect(response).to be_success
      end

      it "invokes tasks with args space separated" do
        expect(TaskTester).to receive(:run).at_least(:once).with('jon', 'doe')
        post :invoke, task_name: 'wrake_test:with_args', args: 'jon doe'
        expect(response).to be_success
      end

      it "invokes tasks with args as array", :pending do
        expect(TaskTester).to receive(:run).at_least(:once).with('jon', 'doe')
        post :invoke, task_name: 'wrake_test:with_args', args: ['jon', 'doe']
        expect(response).to be_success
      end
    end

    context "when not authorized" do
      it "raises error"  do
        post :invoke, task_name: 'wrake_test:with_args', args: 'jon doe'
        expect(response).not_to be_success
      end
    end
  end

end
