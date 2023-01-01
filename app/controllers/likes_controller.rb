# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    return unless @article.status == 'published'

    like = @article.likes.new(user_id: current_user.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    @article = Article.find(params[:article_id])
    like = @article.likes.find_by(user_id: current_user.id)
    like.destroy if like.present?
    redirect_to request.referer
  end
end
