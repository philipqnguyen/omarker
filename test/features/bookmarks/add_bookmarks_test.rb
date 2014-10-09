# require "test_helper"

# describe "Add bookmarks on main page" do
#   before do
#     Capybara.current_driver = :poltergeist
#   end

#   it "should allow users to add a bookmark" do
#     sign_in
#     links = page.all('.block-link').count

#     page.execute_script("document.getElementById('bookmark_website').value='http://en.wikipedia.org/wiki/Gerbil'")
#     page.execute_script("document.forms[1].submit()")

#     page.all('.block-link').count.must_equal(links + 1)
#   end

#   after do
#     Capybara.use_default_driver
#   end
# end
