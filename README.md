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

```
require 'geminabox/rake'
Geminabox::Rake.install dir: './client', host: 'http://user:password@server.org/'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
