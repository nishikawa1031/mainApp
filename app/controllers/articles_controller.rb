class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles
  def index
    if params[:status] == "draft"
      @articles = Article.where(status: "draft").where(user_id: current_user.id).order("created_at DESC")
    else
      @articles = Article.where(status: "published").order("created_at DESC")
    end
    @user = current_user
    @users = User.all
    @categories = Category.all
  end

  # GET /articles/1
  def show
    @categories = @article.categories.pluck(:name)
    @user = @article.user
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :status, :user_id)
    end
end
