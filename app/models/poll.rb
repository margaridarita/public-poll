class Poll < ApplicationRecord
  belongs_to :user
  has_many :saves, :votes, dependent: :destroy
  has_many :categories_polls
  has_many :categories, through: :categories_polls

  validates :question, length: { maximum: 150 }, presence: true
end
