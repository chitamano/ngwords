$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'ngwords/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ngwords'
  s.version     = Ngwords::VERSION
  s.authors     = ['chitamano']
  s.email       = ['chitamanokokoro@gmail.com']
  s.homepage    = 'https://github.com/chitamano/ngwords'
  s.summary     = 'Ngwords prevents prohibited words from being registered in your application.'
  s.description = 'Ngwords prevents prohibited words from being registered in your application. The prohibited word list can be set in the YAML data format. Ngwords currently only works with Rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'moji'
  s.add_dependency 'rails'
  s.add_dependency 'settingslogic'

  s.add_development_dependency 'sqlite3'
end
