#!/usr/bin/env rake

require 'bundler/setup'
require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')

require 'appraisal'

task :default => [:spec]
