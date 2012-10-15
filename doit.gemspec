# -*- encoding: utf-8 -*-
require File.expand_path('../lib/doit/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Thorn"]
  gem.email         = ["thorncp@gmail.com"]
  gem.description   = "Simple CLI todo tool"
  gem.summary       = "Simple CLI todo tool"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "doit"
  gem.require_paths = ["lib"]
  gem.version       = Doit::VERSION

  gem.add_development_dependency 'rspec', '~> 2.11'
end
