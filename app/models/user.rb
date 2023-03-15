class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  has_many :polls, dependent: :destroy
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  has_many :searches, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_one_attached :photo

  validates :username, presence: true, length: { maximum: 15 }, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def friendships
    Friendship.where(to_user: self).or(Friendship.where(from_user: self))
  end

  def friendships_requested
    Friendship.where(to_user: self).requested
  end

  def voted?(poll)
    poll.votes.pluck(:user_id).include?(self.id)
  end
end
