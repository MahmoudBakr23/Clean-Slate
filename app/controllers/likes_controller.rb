class LikesController < ApplicationController
    include SessionsHelper
    include ApplicationHelper
    before_action :set_like_article
    before_action :require_user
    def create
        @like = current_user.likes.new(article_id: @article.id)
        if @like.save
            redirect_to article_path(@article)
        end
    end

    def destroy
        like = Like.find_by(id: params[:id], author: current_user, article_id: @article.id)
        if like
            like.destroy
            redirect_to article_path(@article)
        end
    end

    private

    def set_like_article
        @article = Article.find(
            params[:article_id]
        )
    end
end
