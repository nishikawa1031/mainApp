# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :correct_user, only: %i[edit update destory]

  def show
    @user = User.find_by(username: params[:username])
    @articles = @user.articles
    @articles = @articles.page(params[:page]).per(10)
    @number_of_articles = @articles.count
  end

  private

  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end
end
