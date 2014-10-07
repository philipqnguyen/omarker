ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Spec class for test/features/**
class FeatureSpec < Capybara::Rails::TestCase
  include Capybara::DSL
  Capybara.default_driver = :rack_test
  # Capybara.javascript_driver = :poltergeist
  register_spec_type(/page$/, self)
end
