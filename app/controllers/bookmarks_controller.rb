class BookmarksController < ApplicationController
    before_action :authenticate_user!
  
    def create
        binding.pry
      @article = Article.find(params[:article_id])
      bookmark = @article.bookmarks.new(user_id: current_user.id)
      if bookmark.save
        redirect_to request.referer
      else
        redirect_to request.referer
      end
    end
  
    def destroy
      @article = article.find(params[:article_id])
      bookmark = @article.bookmarks.find_by(user_id: current_user.id)
      if bookmark.present?
          bookmark.destroy
          redirect_to request.referer
      else
          redirect_to request.referer
      end
    end
end