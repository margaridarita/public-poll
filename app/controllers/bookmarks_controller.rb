class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[destroy]

  def create
    @poll = Poll.find(params[:poll_id])
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.poll = @poll
    if @bookmark.save
      # path to the poll page that was just created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to polls_path, status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
