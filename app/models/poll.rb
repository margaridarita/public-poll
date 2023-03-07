class Poll < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :question, length: { maximum: 150 }, presence: true
  validates :first_option, length: { maximum: 100 }, presence: true
  validates :second_option, length: { maximum: 100 }, presence: true

end
