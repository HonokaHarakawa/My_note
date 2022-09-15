class Post < ApplicationRecord

  attachment :image
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  validates :body, presence: true
end
