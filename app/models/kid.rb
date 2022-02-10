class Kid < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :dictionary

  validates :first_name, :last_name, :age, :birthday, presence: true
  validates :age, numericality: { only_integer: true }
end
