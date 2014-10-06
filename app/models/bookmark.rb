class Bookmark < ActiveRecord::Base
  validates :website, presence: true
end
