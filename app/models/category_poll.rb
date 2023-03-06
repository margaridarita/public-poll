class CategoryPoll < ApplicationRecord
  belongs_to :category
  belongs_to :poll
end
