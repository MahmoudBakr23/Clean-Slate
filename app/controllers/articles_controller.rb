class ArticlesController < ApplicationController
  include SessionsHelper
  include ApplicationHelper
  before_action :require_user
  before_action :set_article, only: %i[show edit update destroy]
  def show
    @categories = @article.categories.by_date
  end

  def new
    @article = Article.new
    @categories = Category.all.by_date
  end

  def create
    @article = current_user.articles.build(article_params)
    @category = Category.find_by(id: categories_params[:category_id])
    @article.categories << @category unless @category.nil?
    if @article.save
      flash[:primary] = "Article created!"
      redirect_to article_path(@article)
    else
      flash[:danger] = "Something went wrong!"
      render 'new'
    end
  end

  def edit; end

  def update
    @category = Category.find_by(id: categories_params[:category_id])
    if !@article.categories.include?(@category)
      @article.categories << @category unless @category.nil?
      @article.update(article_params)
      flash[:primary] = "Article updated!"
      redirect_to article_path(@article)
    elsif @article.categories.include?(@category)
      flash[:danger] = "Already exists"
      redirect_to article_path(@article)
    else
      flash[:danger] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:primary] = "Aritcle deleted!"
    else
      flash[:danger] = "Something went wrong!"
    end
    redirect_to root_path
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :body, :category_list)
  end

  def categories_params
    params.require(:article).permit(:category_id)
  end

  def set_article
    @article = Article.find(
    params[:id]
    )
  end
end
