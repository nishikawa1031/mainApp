# frozen_string_literal: true

class UsersController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.find_by(id: params[:id])
    @articles = @user.articles
    @articles = @articles.page(params[:page]).per(10)
    @number_of_articles = @articles.count
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  private
end
