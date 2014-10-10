ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/pride'
require 'capybara/poltergeist'

class ActiveSupport::TestCase
  fixtures :all

  def sign_in(user = :user_1)
    visit new_user_session_path
    fill_in 'Email', with: users(user).email
    fill_in 'Password', with: 'password'
    click_on 'Log in'
  end
end

class FeatureSpec < Capybara::Rails::TestCase
  include Capybara::DSL
  Capybara.default_driver = :rack_test
  # Capybara.javascript_driver = :poltergeist
  register_spec_type(/page$/, self)
end
