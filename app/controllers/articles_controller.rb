# frozen_string_literal: true

class ArticlesController < ApplicationController
  impressionist actions: [:show]

  before_action :set_article, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destory]

  # GET /articles
  def index
    if current_user
      # ログインユーザーのデータを取得
      @articles = Article.where(user_id: current_user.id).order('start_time DESC').page(params[:page]).per(5)
      @people = Person.where(creater_id: current_user.id)
      @number_of_articles = @articles.count
      @user = current_user
    else
      # サンプルデータをロード
      seed_data = JSON.parse(File.read(Rails.root.join('db', 'seed_data.json')))

      @number_of_articles = @articles.size
      @user = nil
    end
  end

  # GET /articles/1
  def show
    ActiveStorage::Current.host = 'http://localhost:3000'

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
    @article = current_user.articles.build(article_params)

    # 新しいpersonが作成される場合、そのpersonのcreater_idを設定する
    @article.people.each { |person| person.creater_id ||= current_user.id }

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
