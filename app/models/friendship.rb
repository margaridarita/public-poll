class Friendship < ApplicationRecord
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'

  enum status: { requested: 0, accepted: 1, rejected: 2 }
end
