class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    before_action :correct_user, only: [:edit, :update, :destory]

    def show
        @user = User.find_by(username: params[:username])
        @articles = @user.articles
    end

    private
        def correct_user
            redirect_to(root_url) unless current_user?(@user)
        end
end
