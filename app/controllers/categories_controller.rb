class CategoriesController < ApplicationController
  include ApplicationHelper
  before_action :require_user, only: %i[index show]

  def index
    @categories = Category.all.by_date
  end

  def show
    @category = Category.find(
    params[:id]
    )
    @articles = @category.articles.by_most_recent
  end

end
