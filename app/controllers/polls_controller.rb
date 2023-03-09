class PollsController < ApplicationController
  before_action :set_poll, only: %i[show destroy total_votes]


  def index
    @polls = Poll.all
  end

  def new
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
    @vote = Vote.new
    @bookmark = Bookmark.new
    @your_vote = Vote.find_by(user: current_user, poll: @poll) if @poll.votes.pluck(:user_id).include?(current_user.id)

    @first_votes_count = Vote.where(poll_id: @poll.id, chosen_option: @poll.first_option).count.to_f
    @second_votes_count = Vote.where(poll_id: @poll.id, chosen_option: @poll.second_option).count.to_f

    @total_votes_count = Vote.where(poll_id: @poll.id).count.to_f

    @first_percentage = (@first_votes_count / @total_votes_count) * 100
    @second_percentage = (@second_votes_count / @total_votes_count) * 100

    @user_votes = Vote.find_by(poll_id: @poll.id, user_id: current_user).chosen_option

    if Vote.find_by(poll_id: @poll.id, user_id: current_user).chosen_option == @poll.first_option
      @same = @first_percentage
    else
      @same = @second_percentage
    end
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
    params.require(:poll).permit(:question, :first_option, :second_option, :category_id)
  end
end
