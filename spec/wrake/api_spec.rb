require "spec_helper"

describe Wrake::Api, '#invoke_task' do
  let(:url)      { 'http://example.com/wrake' }
  let(:username) { 'username' }
  let(:password) { 'password' }

  subject(:api) { Wrake::Api.new(url: url, username: username, password: password) }

  it "creates a task request with the correct params" do
    response = double(:response)

    expect(response).to receive(:perform)

    expect(Wrake::Api::Request).to receive(:new).with("#{url}/tasks/print:full_name", {
      args: 'James Bond',
      basic_auth: { username: username, password: password }
    }).and_return(response)

    api.invoke_task('print:full_name', args: "James Bond")
  end

  it "return a task request response" do
    response = api.invoke_task('print:full_name', args: "James Bond")
    expect(response).to be_a(Wrake::Api::Response)
  end
end
