# require "test_helper"

# describe "Add bookmarks on main page" do
#   before do
#     Capybara.current_driver = :poltergeist
#   end
#   it "should allow users to add a bookmark" do
#     sign_in

#     page.execute_script("document.getElementById('bookmark_website').value='http://en.wikipedia.org/wiki/Gerbil'")
#     page.execute_script("document.forms[1].submit()")
#     page.text.must_include "Gerbil - Wikipedia"
#   end
#   after do
#     Capybara.use_default_driver
#   end
# end
