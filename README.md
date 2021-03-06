# Geminabox::Rake

A simple extension to use bundler's rake tasks with a custom geminabox server.

## Installation

Add this line to your application's Gemfile:

    gem 'geminabox-rake'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geminabox-rake

## Usage

Instead of requiring bundler's rake tasks in your Rakefile use `geminabox-rake`:

```ruby
#require 'bundler/gem_tasks' # Do not require bundler's tasks

require 'geminabox/rake'
Geminabox::Rake.install
```

You can also specify gem dir or geminabox server in your Rakefile:

```ruby
require 'geminabox/rake'
Geminabox::Rake.install dir: './client', host: 'http://user:password@gems.server.org/'
```

You could also specify multiple hosts by passing array to host key in options:

```ruby
require 'geminabox/rake'
Geminabox::Rake.install dir: './client', host: ['http://user:password@gems.server.org/', 'http://backup.host']
```

By default all tasks will be scoped under the `geminabox` namespace to avoid accidental pushes to rubygems.org.
You can define your own namespace:

```ruby
require 'geminabox/rake'
Geminabox::Rake.install namespace: 'my'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
