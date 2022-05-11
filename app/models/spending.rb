class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :genre
end
