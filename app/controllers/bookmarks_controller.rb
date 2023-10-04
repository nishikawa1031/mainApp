# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!
  def create
    @article = Article.find(params[:article_id])
    return if current_user?(@article.user)

    bookmark = @article.bookmarks.new(user_id: current_user.id)
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    @article = Article.find(params[:article_id])
    return if current_user?(@article.user)
    bookmark = @article.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy if bookmark.present?
    redirect_to request.referer
  end
end
