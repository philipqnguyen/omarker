require 'test_helper'

describe 'Deleting bookmarks from public page' do
  it 'should not let users delete bookmarks from public view' do
    sign_in

    first(:link, 'Private').click
    previous_link_count = page.all(:link, 'x').count

    page.all(:link, 'x').count.must_equal 0
  end
end
