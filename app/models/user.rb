class User < ApplicationRecord
  acts_as_token_authenticatable
  acts_as_taggable_on :tags
  has_many :kids, dependent: :destroy
  has_many :dictionaries, through: :kids, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  has_one_attached :photo
end
