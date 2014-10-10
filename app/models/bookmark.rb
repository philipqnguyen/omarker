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
      scraped_url = MetaInspector.new(url, :html_content_only => true)
    rescue Faraday::ConnectionFailed, Addressable::URI::InvalidURIError, URI::InvalidURIError
      scraped_url = nil
    end

    if scraped_url.content_type == "text/html"
      add_info(scraped_url, user)
    else
      add_image(scraped_url, user)
    end
  end

  def add_image(scrape, user)
    self.name = scrape.url
    self.website = scrape.url
    self.picture = scrape.url
    self.info = scrape.url
    user.bookmarks << self
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

