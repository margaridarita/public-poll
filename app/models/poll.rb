class Poll < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :question, length: { maximum: 150 }, presence: true
  validates :first_option, length: { maximum: 100 }, presence: true
  validates :second_option, length: { maximum: 100 }, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_category_and_question,
  against: [:question, :first_option, :second_option],
  associated_against: {
  category: [ :title ]
  },
  using: {
    tsearch: { prefix: true }
  }
end
