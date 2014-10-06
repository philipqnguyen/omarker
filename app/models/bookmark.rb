class Bookmark < ActiveRecord::Base
  validates :website, presence: true
  fuzzily_searchable :info

  def self.search(query)
    where("info like ?", "%#{query}%")
  end
end
