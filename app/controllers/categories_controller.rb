class CategoriesController < ApplicationController
  def show
    @categories = ["Arts", "Animals", "Business", "Movies", "Food", "Games", "Health", "Music", "News", "Politics", "Science", "Sports", "Technology", "Travel", "Fashion", "Humor", "Relationships", "Education", "History", "Nature", "Books", "Horror"]
    @category = Category.find_by(title: params[:title])
  end
end
