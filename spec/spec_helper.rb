require "bundler/setup"

require "active_record"
require "action_view"
require "action_controller"
require "judge"
require "simple_form"
require "judge/simple_form"
require "factory_girl"
require "rspec"

require_relative "setup"
require_relative "factories"

RSpec.configure do |config|
  config.color_enabled = true
end