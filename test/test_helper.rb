$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))

require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
]

SimpleCov.start

require 'tlopo/executor'
require 'minitest/autorun'
