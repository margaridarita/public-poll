class PollsController < ApplicationController
  before_action :set_poll, only: %i[show destroy]
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

  def show; end

  def destroy
    @poll.destroy
    redirect_to polls_path, status: :see_other
  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:name, :description, :available, :price_per_day, :category)
  end
end
