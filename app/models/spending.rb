class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  validates :genre_id, presence: true
  validates :spending_amount , numericality: true
end
