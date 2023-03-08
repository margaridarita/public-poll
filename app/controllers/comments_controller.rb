class CommentsController < ApplicationController
  before_action :set_vote, only: %i[create]
  before_action :set_poll, only: %i[index new]

  def index
    @comments = Comment.where(poll_id: @poll)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.vote = @vote
    @comment.user = current_user

    if @comment.save
      redirect_to poll_path(@vote.poll)
    else
      redirect_to poll_path(@vote.poll), status: :unprocessable_entity
    end
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

  def set_vote
    @vote = Vote.find(params[:vote_id])
  end
end
