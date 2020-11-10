class HomeController < ApplicationController
  def index
    @likes_array = []
    Article.all.each { |article| @likes_array << article.likes }
    @likes = []
    @likes_array.each { |likes| @likes << likes.count }
    @max = @likes.uniq.max(1).first
    @articles = Article.all.by_most_recent

    # @category_articles = []
    # Category.all.each { |cat| @category_articles << cat.articles if !cat.articles.nil? }
    # @category_articles_likes = []
    # @all_articles = []
    # @category_articles.each do |articles|
    #   articles.each do |article|
    #     @category_articles_likes << article.likes if !article.likes.nil?
    #     @all_articles << article
    #   end
    # end
    # @category_likes = []
    # @category_articles_likes.each { |likes| @category_likes << likes.count }
    # @multiple_max = @category_likes.max(1)
    # @categories = Category.all.by_date

    # @likes_number = []
    #   Category.all.by_date.each do |category|
    #     category.articles.each do |article|
    #       @likes_number << article.likes.count
    #     end
    #   end
    # end

    #   Article.all.each do |a|
    #     @likes_number << a.likes.count
    #   end
    #   @sum_likes = @likes_number.sum
    # end

    @categories = Category.all.by_date.limit(4)
  end
end
