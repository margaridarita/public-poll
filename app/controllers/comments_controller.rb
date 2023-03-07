class CommentsController < ApplicationController
  before_action :set_poll, only: %i[index new create]

  def index
    @comments = Comment.where(poll_id: @poll)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.poll = @poll
    @comment.user = current_user

    if @comment.save
      redirect_to comment_path(@comment)
    else
      redirect_to comment_path(@comment), status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    @booking.save
    redirect_to comment_path(@comment)
  end

  def destroy
    @comment.destroy
    redirect_to comment_path, status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_poll
    @poll = Poll.find(params[:poll_id])
  end
end
