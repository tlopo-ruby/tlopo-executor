# tlopo-retry
[![Gem Version](https://badge.fury.io/rb/tlopo-executor.svg)](http://badge.fury.io/rb/tlopo-executor)
[![Build Status](https://travis-ci.org/tlopo-ruby/tlopo-executor.svg?branch=master)](https://travis-ci.org/tlopo-ruby/tlopo-executor)
[![Code Climate](http://img.shields.io/codeclimate/github/tlopo-ruby/tlopo-executor.svg)](https://codeclimate.com/github/tlopo-ruby/tlopo-executor)
[![Dependency Status](https://gemnasium.com/tlopo-ruby/tlopo-executor.svg)](https://gemnasium.com/tlopo-ruby/tlopo-executor)

A simple Executor service aka Threadpool executor

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tlopo-executor'
```

And then execute:

```Bash
bundle
```

Or install it yourself as:

```Bash
gem install tlopo-executor
```

## Usage

Simple retry usage 

```ruby
require 'tlopo/executor'
require 'socket'
require 'timeout'

exec = Tlopo::Executor.new

['80','443','22'].each do |port|
  exec.schedule(
    proc do
      begin
        Timeout.timeout(1){TCPSocket.new('www.google.co.uk', port ).close}
      rescue
        raise "Port #{port} is not open"
      end
    end
  )
end
errors = exec.run.errors
p errors unless exec.success?
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kubeclient/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Test your changes with `rake test rubocop`, add new tests if needed.
4. If you added a new functionality, add it to README
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request

## Tests

This library is tested with Minitest.
Please run all tests before submitting a Pull Request, and add new tests for new functionality.

Running tests:
```ruby
rake test
```
