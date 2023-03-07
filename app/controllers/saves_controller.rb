class SavesController < ApplicationController
  before_action :set_save, only: %i[destroy]

  def index
    @saves = Save.all
  end

  def new
    @save = Save.new
  end

  def create
    @save = Save.new(save_params)
    @save.user = current_user
    if @save.save
      redirect_to poll_path(@save)
      # path to the poll page that was just created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @save.destroy
    redirect_to polls_path, status: :see_other
  end

  private

  def set_save
    @save = Save.find(params[:id])
  end

  def save_params
    params.require(:save).permit()
  end
end
