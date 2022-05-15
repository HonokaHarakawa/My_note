class Spending < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  enum payment_method: { cash: 0, credit: 1, electric: 2, code: 3 }
end
