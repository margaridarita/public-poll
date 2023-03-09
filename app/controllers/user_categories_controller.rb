class UserCategoriesController < ApplicationController
  def new
    @user_category = UserCategory.new
  end

  def create
    @category = Category.find(params[:user_category][:category])
    @user_category = UserCategory.new(category: @category, user: current_user)
    if @user_category.save
      redirect_to polls_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
