
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tlopo/executor/version'

Gem::Specification.new do |spec|
  spec.name          = 'tlopo-executor'
  spec.version       = Tlopo::Executor::VERSION
  spec.authors       = ['Tiago Lopo']
  spec.email         = ['tiagolopo@yahoo.com.br']

  spec.summary       = 'A simple executor service aka threadpool executor'
  spec.description   = 'A simple executor service aka threadpool executor'
  spec.homepage      = 'https://github.com/tlopo-ruby/tlopo-executor'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency('bundler', '~> 2.4')
  spec.add_development_dependency('minitest', '~> 5.0')
  spec.add_development_dependency('simplecov', '~> 0.22')
  spec.add_development_dependency('rake', '~> 13.0')
  spec.add_development_dependency('rubocop', '~> 1.6')
end
