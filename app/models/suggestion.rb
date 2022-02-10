class Suggestion < ApplicationRecord
  validates :word, presence: true, uniqueness: true
end
