class Article < ApplicationRecord
  acts_as_taggable_on :tags
  validates :title, :date, :author, :content, :image, presence: true
end
