class VotesController < ApplicationController

  def create
    @poll = Poll.find(params[:poll_id])
    @vote = Vote.new(chosen_option: params[:chosen_option])
    @vote.user = current_user
    @vote.poll = @poll
    if @vote.save
      redirect_to poll_path(@vote.poll), notice: "you voted in #{@vote.chosen_option}"
      # path to the poll page that was just created
    else
      render :new, status: :unprocessable_entity
    end
  end
end
