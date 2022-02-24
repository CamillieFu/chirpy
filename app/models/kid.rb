class Kid < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
  belongs_to :dictionary
  has_many :statistics

  validates :first_name, :last_name, :birthday, presence: true
end
