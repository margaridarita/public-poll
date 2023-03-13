class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home trending]
  before_action :set_user, only: %i[dashboard my_polls my_bookmarks my_account]

  def home
    @action_name = "home"
  end

  def trending
    @polls = Poll.last_week.order(votes_count: :desc).limit(20)
  end

  def search
    @action_name = "search"
  end

  def dashboard
  end


  private

  def set_user
    @user = current_user
  end
end

# Poll.all.each do |poll|
#   Poll.update_counters(poll.id, votes_count: Vote.where(poll: poll).count)
# end
