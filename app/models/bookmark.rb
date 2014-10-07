class Bookmark < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
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
