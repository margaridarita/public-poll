class UserCategoriesController < ApplicationController
  def new
    @user_category = UserCategory.new
  end

  def create

  end

  private

  def user_category_params
    params.require(:user_category).permit(:poll, :user)
  end
end


@user_categories = UserCategory.new(user_category_params)
if @user_category.select?
  redirect_to polls_path(@user_category)

else
  render :new, status: :unprocessable_entity
end
