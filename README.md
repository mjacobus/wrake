# Wrake

A web partner of Rake. Runs wrake via web api.

[![Build Status](https://travis-ci.org/mjacobus/wrake.png?branch=master)](https://travis-ci.org/mjacobus/wrake)
[![Coverage Status](https://coveralls.io/repos/mjacobus/wrake/badge.png)](https://coveralls.io/r/mjacobus/wrake)
[![Code Climate](https://codeclimate.com/github/mjacobus/wrake.png)](https://codeclimate.com/github/mjacobus/wrake)
[![Dependency Status](https://gemnasium.com/mjacobus/wrake.png)](https://gemnasium.com/mjacobus/wrake)
[![Gem Version](https://badge.fury.io/rb/wrake.png)](http://badge.fury.io/rb/wrake)

## But why?

When you run rake inside rails, you have to load the entire application. By running wrake,
rake will be callled via web API, through your aready loaded rails app.

## Instalation

Add this line to your application's Gemfile:

    gem 'wrake'

And then execute:

    $ bundle
    $ rails g wrake:install

This will create the following files:

- ```config/wrake.yml``` - the configuration file is self explicative.
- ```config/initializers/wrake.rb``` - the configuration file is self explicative.

Also, you wil need to mount the engine:

```ruby
# config/routes.rb

mount Wrake::Engine, at: 'wrake'
```

## Usage

### Using API
```ruby
api  = Wrake::Api.new(url: base_url, username: username, password: password)

# or to get the api with default configuration

api = Wrake.api

response = api.invoke_task('some:task', { param: 'value' })

puts response.code, response.headers, response.body, response.message

```

### Using the CLI

```bash
wrake cache:clean

wrake mail:welcome new@user.com
```

### Password protecting the API

By default, the API is protected by Basic Auth. You could change the default behavior
by overwriting the wrake_authorization method:

```ruby
class ApplicationController < ActionController::Base
  def wrake_authorization
    authenticate_or_request_with_http_basic do |username, password|
      User.with_wrake_privileges.where(email: username, password: password).first!
    end
  end
end
```


## TODO

- [Next features](https://github.com/mjacobus/wrake/issues?labels=enhancement&page=1&state=open)

## Authors

- [Marcelo Jacobus](https://github.com/mjacobus)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

** Do not forget to write tests**
