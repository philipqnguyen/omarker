# require "test_helper"

# NOTE: This test takes forever to run and is unreliable.

# describe 'Clicking on a bookmark should redirect user to proper web page' do
#   before do
#     Capybara.current_driver = :poltergeist
#   end

#   it 'should allow users to be redirected to the target page' do
#     sign_in

#     first(:link, 'Private').click
#     page.first('.block-link').click

#     page.text.must_include 'in a language'
#   end

#   after do
#     Capybara.use_default_driver
#   end
# end
