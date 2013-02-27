# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'judge/simple_form/version'

Gem::Specification.new do |s|
  s.name        = 'judge-simple_form'
  s.version     = Judge::SimpleForm::VERSION
  s.authors     = ['Joe Corcoran']
  s.email       = 'joe@tribesports.com'
  s.homepage    = 'http://github.com/joecorcoran/judge-simple_form'
  s.summary     = 'SimpleForm adapter for Judge'
  s.description = 'Easily add Judge client side validation to your SimpleForm forms.'

  s.files         = Dir['lib/**/*'] + ['LICENSE.txt', 'README.md']
  s.require_paths = ['lib']

  s.add_runtime_dependency 'judge',       '~> 2.0'
  s.add_runtime_dependency 'simple_form', '~> 2.0'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rails',   '~> 3.2'
  s.add_development_dependency 'sqlite3', '~> 1.3.7'
  s.add_development_dependency 'rspec',   '~> 2.13'
end