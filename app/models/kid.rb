class Kid < ApplicationRecord
  belongs_to :user
  belongs_to :dictionary

  validates :first_name, :last_name, :age, :ethnicity, :birthday, presence: true
  validates :age, numericality: { only_integer: true }
  validates :gender_identity, inclusion: { in: %w[Male Female Other] }
  validates :sexual_orientation, inclusion: { in: %w[Heterosexual Homosexual Pansexual Bisexual Asexual] }
end
