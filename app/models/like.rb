class Like < ApplicationRecord
  belongs_to :goal
  belongs_to :user
  validates_uniqueness_of :goal_id, scope: :user_id
end
