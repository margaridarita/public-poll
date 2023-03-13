class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home trending]
  before_action :set_user, only: %i[dashboard my_polls my_bookmarks my_account]

  def home
    @action_name = "home"
  end

  def trending
    @polls = Poll.all
    @polls.select { |poll| poll.created_at == ((Date.today - 7)..Date.today) }.sort_by { |p| p.votes.count }.reverse.first(20)
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
    #dash
  end

  private

  def set_user
    @user = current_user
  end

end
