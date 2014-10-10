class Bookmark < ActiveRecord::Base
  validates :website, presence: true

  has_many :ownerships
  has_many :users, through: :ownerships
  include PgSearch
  pg_search_scope :super_search,
                  against: [:name, :info],
                  using: {
                    tsearch:    { dictionary: 'english' },
                    trigram:    { threshold:  0.1 },
                    dmetaphone: {}
                  }

  def self.search(query)
    if query.present?
      super_search query
    else
      order('bookmarks.created_at DESC').all
    end
  end

  def scrape_url(url, user)
    begin
      scraped_url = MetaInspector.new(url)
    rescue Faraday::ConnectionFailed, Addressable::URI::InvalidURIError
      scraped_url = nil
    end

    add_info(scraped_url, user)
  end

  def add_info(scrape, user)
    return false if scrape.nil?
    self.name = scrape.title
    self.website = scrape.url
    self.info = scrape.description

    self.info += scrape.meta['keywords'] if scrape.meta["keywords"]

    if scrape.image
      self.picture = scrape.image
    elsif scrape.images.any?
      self.picture = scrape.images[Random.new.rand(scrape.images.length)]
    elsif scrape.favicon
      self.picture = scrape.favicon
    end
    user.bookmarks << self
  end
end
