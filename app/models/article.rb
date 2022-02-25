class Article < ApplicationRecord
  acts_as_taggable_on :tags
  validates :title, :date, :author, :content, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_content_and_title,
                  against: {
                    content: 'A',
                    title: 'B'
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
