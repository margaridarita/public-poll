  class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll, counter_cache: true
  has_many :comments, dependent: :destroy
end
