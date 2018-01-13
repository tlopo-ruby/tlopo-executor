source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# Specify your gem's dependencies in tlopo-executor.gemspec
gemspec

group :test do
  gem 'coveralls', '~> 0.8.17'
  gem 'simplecov', '~> 0.12.0'
end

if RUBY_VERSION > '2.1.0'
  group :perf do
    gem 'memory_profiler', '~> 0.9.8'
  end
end
