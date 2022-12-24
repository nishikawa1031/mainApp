class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    like = @article.likes.new(user_id: current_user.id)
    if like.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    like = @article.likes.find_by(user_id: current_user.id)
    if like.present?
        like.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
