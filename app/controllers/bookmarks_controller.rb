class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[destroy]

  # AJAX request
  def create
    @poll = Poll.find(params[:poll_id])
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.poll = @poll

    if @bookmark.save
      render json: @bookmark.as_json.merge(url: bookmark_path(@bookmark))
    else
      head :unprocessable_entity
    end
  end

  # AJAX request
  def destroy
    @bookmark.destroy
    head :ok
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
