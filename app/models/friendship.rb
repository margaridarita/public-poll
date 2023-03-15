class Friendship < ApplicationRecord
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'

  enum status: { requested: 0, accepted: 1, rejected: 2, removed: 3 }

  def self.between(user1, user2)
    where(from_user: user1).where(to_user: user2)
                           .or(where(from_user: user2).where(to_user: user1))
                           .first
  end
end
