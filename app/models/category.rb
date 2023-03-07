class Category < ApplicationRecord
  has_many :polls
  has_many :users, through: :user_categories
end
