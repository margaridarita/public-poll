class PollsController < ApplicationController
  before_action :set_poll, only: %i[show destroy total_votes live live_index]


  def index
    if params[:query].present?
      @polls = Poll.search_by_category_and_question(params[:query])
      @search = Search.where(query: params[:query], user: current_user).first_or_create
      @search.touch
    else
      @polls = Poll.all.order(created_at: :desc)
    end
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.user = current_user
    if @poll.save
      redirect_to polls_path
      # path to the poll page that was just created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @vote = Vote.new
    @bookmark = Bookmark.new
    build_insane_variables
  end

  def live
    build_insane_variables

    render partial: "polls/poll_card", formats: [:html]
  end

  def live_index
    build_insane_variables

    render partial: "polls/chart", locals: { poll: @poll }, formats: [:html]
  end

  def destroy
    @poll.destroy
  end

  private

  def build_insane_variables
    @your_vote = Vote.find_by(user: current_user, poll: @poll) if @poll.votes.pluck(:user_id).include?(current_user.id)

    @first_votes_count = Vote.where(poll_id: @poll.id, chosen_option: @poll.first_option).count.to_f
    @second_votes_count = Vote.where(poll_id: @poll.id, chosen_option: @poll.second_option).count.to_f

    @total_votes_count = Vote.where(poll_id: @poll.id).count.to_f

    @first_percentage = @total_votes_count.zero? ? 0.0 : ((@first_votes_count / @total_votes_count) * 100).round
    @second_percentage = @total_votes_count.zero? ? 0.0 : ((@second_votes_count / @total_votes_count) * 100).round


    if Vote.find_by(poll_id: @poll.id, user_id: current_user)
      @user_votes = Vote.find_by(poll_id: @poll.id, user_id: current_user).chosen_option

      if Vote.find_by(poll_id: @poll.id, user_id: current_user).chosen_option == @poll.first_option
        @same = @first_percentage
      else
        @same = @second_percentage
      end
    end
  end

  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:question, :first_option, :second_option, :category_id)
  end
end
