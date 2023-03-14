class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home trending]
  before_action :set_user, only: %i[dashboard my_polls my_bookmarks my_account]

  def home
  end

  def trending
    @polls = Poll.last_week.order(votes_count: :desc).limit(20)
  end

  # seach model

  def search
    @action_name = "search"
    @searches = Search.where(user_id: current_user.id).order(updated_at: :desc)
  end

  def delete_search
    @search = Search.find(params[:id])
    @search.destroy
    redirect_to search_path
  end

  # seach model

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
