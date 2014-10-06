json.array!(@bookmarks) do |bookmark|
  json.extract! bookmark, :id
  json.url bookmark_url(bookmark, format: :json)
end
