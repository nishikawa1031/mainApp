# frozen_string_literal: true

class ArticlesController < ApplicationController
  impressionist actions: [:show]

  before_action :authenticate_user!, except: %i[show index]
  before_action :set_article, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destory]

  # GET /articles
  def index
    if current_user
      @articles = Article.where(user_id: current_user.id).order('created_at DESC')
      @people = Person.includes(:articles)
        .where(user_id: current_user.id)
        .where.not(articles: { id: nil })
    else
      @articles = Article.order('created_at DESC')
      @people = Person.all
    end
      @articles = @articles.page(params[:page]).per(5)
      @rank_articles = @articles.order(impressions_count: 'DESC')
      @number_of_articles = @articles.count
      @user = current_user
      @users = User.all
  end

  # GET /articles/1
  def show
    ActiveStorage::Current.host = "http://localhost:3000"
    
    impressionist(@article)
    @article.impressionist_count(filter: :ip_address)
    @user = @article.user
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  def create
    puts params.inspect
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit!
    # params.require(:article).permit(:user_id, :body, :start_time, :end_time, person_ids: [], people_attributes: [:id, :name, :_destroy])
  end

  def correct_user
    @user = User.find(@article.user.id)
    redirect_to(root_url) unless @user == current_user
  end
end
