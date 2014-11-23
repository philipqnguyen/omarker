require 'test_helper'

describe "User navigating web page" do
  it "should be on home screen" do
    visit root_path
    page.text.must_include SiteSetting.title
  end
end
