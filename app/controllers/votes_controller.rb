class VotesController < ApplicationController
  before_action :set_vote, only: %i[show]

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    if @vote.save
      redirect_to poll_path(@vote)
      # path to the poll page that was just created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:user, :poll, :chosen_option)
  end
end
