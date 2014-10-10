require "test_helper"

describe "Add bookmarks on main page" do
  it "should allow users to add a bookmark" do
    sign_in
    links = page.all('.block-link').count

    visit new_bookmark_path
    fill_in 'Website', with: 'http://en.wikipedia.org/wiki/CNBC'
    click_on 'Create Bookmark'

<<<<<<< HEAD
#     page.text.must_include "the free encyclopedia"
#   end
#   after do
#     Capybara.use_default_driver
#   end
# end
=======
    page.all('.block-link').count.must_equal(links + 1)
  end
end
>>>>>>> master
