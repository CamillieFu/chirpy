class Kid < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
  belongs_to :dictionary
  has_many :statistics

  validates :first_name, :last_name, :age, :birthday, presence: true
  validates :age, numericality: { only_integer: true }
end
