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

  private

  def set_user
    @user = current_user
  end
end
