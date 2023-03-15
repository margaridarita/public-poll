class VotesController < ApplicationController

  def create
    @poll = Poll.find(params[:poll_id])
    @vote = Vote.new(chosen_option: params[:chosen_option])
    @vote.user = current_user
    @vote.poll = @poll
    @vote.save

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end
end
