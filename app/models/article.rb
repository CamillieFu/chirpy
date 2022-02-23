class Article < ApplicationRecord
  acts_as_taggable_on :tags
  validates :title, :date, :author, :content, :image, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_content_and_author,
                  against: {
                    title: 'A',
                    content: 'B',
                    author: 'C'
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
