class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  validates :spending_amount, numericality: { only_integer: true }
  validates :genre, presence: true
end
