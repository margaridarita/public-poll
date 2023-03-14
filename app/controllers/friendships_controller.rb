class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    @friendship.from_user = current_user
    @friendship.save

    redirect_to @friendship.to_user
  end

  def update
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update(friendship_params)
    @friendship.save

    redirect_to requested_friendships_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:to_user_id, :status)
  end
end
