# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!
  def create
    @article = Article.find(params[:article_id])
    return unless @article.status == 'published'

    bookmark = @article.bookmarks.new(user_id: current_user.id)
    redirect_to request.referer
  end

  def destroy
    @article = Article.find(params[:article_id])
    bookmark = @article.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy if bookmark.present?
    redirect_to request.referer
  end
end
