require 'bundler/setup'
require 'rails/all'
require 'judge/simple_form'
require 'rspec'
require 'nokogiri'
require_relative 'setup'

RSpec::Matchers.define :have_selector_with_attrs do |selector, attrs|
  match do |actual|
    frag = Nokogiri::HTML::DocumentFragment.parse(actual)
    target = frag.css(selector)
    target && attrs.all? { |a| target.attr(a) != nil }
  end
end
