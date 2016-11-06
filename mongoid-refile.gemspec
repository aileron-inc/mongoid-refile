Gem::Specification.new do |gem|
  gem.name          = 'mongoid-refile'
  gem.version       = '0.0.1'

  gem.required_ruby_version = '>= 2.1.0'

  gem.summary       = 'MongoID integration of the Refile gem'
  gem.description   = 'Allow MongoID to play nicely with refile'
  gem.homepage      = 'https://github.com/aileron-inc/mongoid-refile'

  gem.authors       = ['aileron']
  gem.email         = ['info@aileron.cc']

  gem.license       = 'MIT'
  gem.files         = Dir['README.md', 'LICENSE.txt', 'lib/**/*']
  gem.require_path  = 'lib'

  gem.add_dependency 'refile', '~> 0.6'
  gem.add_dependency 'mongoid', '~> 5.0'

  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.3'
  gem.add_development_dependency 'mongoid-rspec', '~> 3.0.0'
end
