class PollsController < ApplicationController
  before_action :set_poll, only: %i[show destroy]
  def index
    @polls = Poll.all
  end

  def new
    @categories = Category.all
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.user = current_user
    if @poll.save
      redirect_to poll_path(@poll)
      # path to the poll page that was just created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @your_vote = Vote.find_by(user: current_user, poll: @poll) if @poll.votes.pluck(:user_id).include?(current_user.id)
    @vote = Vote.new
    @bookmark = Bookmark.new
  end

  def destroy
    @poll.destroy
    redirect_to polls_path, status: :see_other
  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:question, :first_option, :second_option, :user, :category)
  end
end
