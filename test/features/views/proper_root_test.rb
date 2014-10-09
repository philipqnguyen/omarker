require "test_helper"

describe 'Search results page must be on same page' do
  before do
    sign_in
  end

  it 'should keep users move users from my_links to bookmarks path' do
    click_on 'Private'

    current_path.must_equal bookmarks_path
  end

  it 'should keep users move users from bookmarks path to my_links' do
    click_on 'Private'
    click_on 'Public'

    current_path.must_equal my_links_path
  end

  it 'should keep users on my_links when searching from my_links_path' do
    click_on 'Search'

    current_path.must_equal my_links_path
  end

  it 'should keep users on bookmarks_path when searching from public' do
    click_on 'Private'

    click_on 'Search'

    current_path.must_equal bookmarks_path
  end
end
