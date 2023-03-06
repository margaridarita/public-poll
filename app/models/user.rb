class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  has_many :polls, dependent: :destroy
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments, dependent: :destroy
  has_many :saves, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one_attached :photo

  validates :username, presence: true, length: { maximum: 15 }, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
