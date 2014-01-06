require 'bundler/setup'
require 'rails/all'
require 'judge/simple_form'
require 'rspec'
require 'nokogiri'
require_relative 'setup'

RSpec::Matchers.define :have_attributes do |*expected|
  match do |actual|
    fragment = Nokogiri::HTML::DocumentFragment.parse(actual)
    expected.all? { |e| fragment.css('div input').attr(e) != nil }
  end
end
