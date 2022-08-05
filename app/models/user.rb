class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { male: 0, woman: 1 }
  has_many :incomes
  validates :name, presence: true
  has_many :goals, dependent: :destroy
  has_many :spendings
  attachment :profile_image
  has_many :likes
  def already_liked?(goal)
    self.likes.exists?(goal_id: goal.id)
  end
end
