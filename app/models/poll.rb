class Poll < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :question, length: { maximum: 150 }, presence: true
  validates :first_option, length: { maximum: 100 }, presence: true
  validates :second_option, length: { maximum: 100 }, presence: true
  validate :fields_a_and_b_are_different


  include PgSearch::Model
  pg_search_scope :search_by_category_and_question,
  against: [:question, :first_option, :second_option],
  associated_against: {
  category: [ :title ]
  },
  using: {
    tsearch: { prefix: true }
  }
  def fields_a_and_b_are_different
    if self.first_option == self.second_option
      errors.add(:first_option, 'must be different')
      errors.add(:second_option, 'must be different')
    end
  end

  def bookmarked_by_user?(user)
    bookmark_by_user(user).present?
  end

  def bookmark_by_user(user)
    Bookmark.find_by(user:, poll: self)
  end
end
