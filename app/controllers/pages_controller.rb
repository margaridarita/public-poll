class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user, only: %i[dashboard my_polls my_bookmarks my_account]

  def home
    @action_name = "home"
  end

  def my_account
  end

  def my_polls
  end

  def my_bookmarks
  end

  def trending
    @polls = Poll.all.last_week.sort_by { |p| p.votes.count }.reverse.first(20)
  end

  def search
    @action_name = "search"
  end

  private

  def set_user
    @user = current_user
  end
end
