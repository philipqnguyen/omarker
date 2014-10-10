# require "test_helper"

# describe "Add bookmarks on main page" do
#   before do
#     Capybara.current_driver = :poltergeist
#   end
#   it "should allow users to add a bookmark" do
#     sign_in

#     find('#add_website').fill_in(with: 'http://en.wikipedia.org/wiki/Gerbil')
#     find('#add_website').native.send_keys(:return)

#     page.text.must_include "the free encyclopedia"
#   end
#   after do
#     Capybara.use_default_driver
#   end
# end
