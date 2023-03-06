class Poll < ApplicationRecord
  belongs_to :user
  has_many :saves, :votes, dependent: :destroy

  CATEGORIES = []
  validates :category, inclusion: { in: CATEGORIES }, presence: true
  validates :question, length: { maximum: 150 }, presence: true
end
