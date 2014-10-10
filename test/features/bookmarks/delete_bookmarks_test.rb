require 'test_helper'

describe 'Deleting bookmarks from public page' do
  it 'should not let users delete bookmarks from public view' do
    sign_in

    first(:link, 'Private').click

    page.all(:link, 'x').count.must_equal 0
  end
end

describe 'Deleting bookmarks from the user private page' do
  it 'should let users delete their own bookmarks' do
    sign_in
    visit new_bookmark_path
    fill_in 'Website', with: 'http://en.wikipedia.org/wiki/Gerbil'
    click_on 'Create Bookmark'

    previous_tile_count = page.all('.block-link').count
    first(:link, 'x').click

    page.all(:link, 'x').count.must_equal(previous_tile_count - 1)
  end
end
