require 'test_helper'

<<<<<<< HEAD
describe 'User navigating website' do
  it 'should be on home screen' do
    visit root_url
    page.text.must_include 'Link.ly'
=======
describe "User navigating web page" do
  it "should be on home screen" do
    visit root_path
    page.text.must_include "Link.ly"
>>>>>>> master
  end
end
