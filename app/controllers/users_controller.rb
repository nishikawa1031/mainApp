# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :correct_user, only: %i[edit update destory]

  def show
    @user = User.find_by(username: params[:username])
    @articles = @user.articles
    @articles = Article.draft.where(user_id: current_user.id).order('created_at DESC') if (params[:status] = 'draft')
    if params[:key] == 'bookmarks'
      @articles = Article.joins(:bookmarks).where(bookmarks: { user_id: current_user.id }).order(created_at: :desc)
    end
    if params[:key] == 'likes'
      @articles = Article.joins(:likes).where(likes: { user_id: current_user.id }).order(created_at: :desc)
    end
    @articles = @articles.page(params[:page]).per(10)
    @number_of_articles = @articles.count
    @number_of_published_articles = @user.articles.published.count
    @number_of_draft_articles = @user.articles.draft.count
    @number_of_bookmarked_articles = @user.bookmarks.count
    @number_of_liked_articles = @user.likes.count
  end

  private

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
end
