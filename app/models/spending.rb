class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  validates :genre_id, :spending_amount, presence: true
end
