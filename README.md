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
api  = Wrake::Api.new(base_url: base_url, username: username, password: password)

# or you can instantiate the API with a config file

api = Wrake::Api.from_file(Rails.root.join('config', 'wrake.yml'))

response = api.run('some:task', { param: 'value' })

if response.success?
  # ok
else
  puts response.error_message
end
```

### Using the CLI

```bash
wrake some:task PARAMS="name=foo&lastname=bar"
```

### Generating new tasks

```bash
rails g wrake:task some/task
```

This will create the file ```lib/tasks/some/task.rb``` and all you have to do is
to implement it.

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
