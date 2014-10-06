class Bookmark < ActiveRecord::Base
  validates :website, presence: true
  fuzzily_searchable :info
end
