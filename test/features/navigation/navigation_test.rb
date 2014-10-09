require "test_helper"

describe "User navigating website" do
  it "should be on home screen" do
    visit root_url
    page.text.must_include "Link.ly"
  end
end
