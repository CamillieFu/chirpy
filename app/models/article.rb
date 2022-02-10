class Article < ApplicationRecord
  validates :title, :date, :author, :content, :image, presence: true
end
