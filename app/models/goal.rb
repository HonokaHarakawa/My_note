class Goal < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :goal, presence: true
end
