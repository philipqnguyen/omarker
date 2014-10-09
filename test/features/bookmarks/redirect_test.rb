require "test_helper"

describe 'Clicking on a bookmark should redirect user to proper web page' do
  before do
    Capybara.current_driver = :poltergeist
  end
  it 'should allow users to be redirected to the target page' do
    sign_in

    page.first('.block-link').click

    page.text.must_include 'Find Wikipedia in a language'
  end
  after do
    Capybara.use_default_driver
  end
end
