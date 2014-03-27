require "spec_helper"

describe Wrake::TasksController, "routes" do
  routes { Wrake::Engine.routes }

  it "routes to #invoke" do
    expect(get('/tasks/some:task')).to route_to('wrake/tasks#invoke', task_name: 'some:task')
    expect(post('/tasks/some:task')).to route_to('wrake/tasks#invoke', task_name: 'some:task')
  end
end
