class Bookmark < ActiveRecord::Base
  validates :website, presence: true
  # fuzzily_searchable :info

  def self.search(query)
    if query.present?
        rank = <<-RANK
          ts_rank(to_tsvector(info), plainto_tsquery(#{sanitize(query)})) +
          ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)}))
        RANK
      where("info @@ :q or name @@ :q", q: query).order("#{rank} desc")
    else
      all
    end
  end
end
