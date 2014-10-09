class Bookmark < ActiveRecord::Base

  validates :website, presence: true

  has_many :ownerships
  has_many :users, through: :ownerships
  include PgSearch
  pg_search_scope :super_search,
                  :against => [:name, :info],
                  using: {
                    tsearch:    {dictionary: 'english'},
                    trigram:    {threshold:  0.1},
                    dmetaphone: {}
                  }

  def self.search(query)
    if query.present?
      #   rank = <<-RANK
      #     ts_rank(to_tsvector(info), plainto_tsquery(#{sanitize(query)})) +
      #     ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)}))
      #   RANK
      # where("info @@ :q or name @@ :q", q: query).order("#{rank} desc")
      super_search query
    else
      order('bookmarks.created_at DESC').all
    end
  end

  def add_info(url, user)
        begin
    @scrape = MetaInspector.new(url)
    rescue Faraday::ConnectionFailed, Addressable::URI::InvalidURIError
      @scrape = nil
    end

    unless @scrape.nil?
      self.name = @scrape.title
      self.website = @scrape.url
      self.info = @scrape.description
      @scrape.links do |l|
        self.info += l
      end

      if @scrape.meta["keywords"]
        self.info += @scrape.description
      end
      if @scrape.image
        self.picture = @scrape.image
      elsif @scrape.images.any?
        self.picture = @scrape.images[Random.new.rand(@scrape.images.length)]
      elsif @scrape.favicon
        self.picture = @scrape.favicon
      end
      user.bookmarks << self
    end
  end
end
