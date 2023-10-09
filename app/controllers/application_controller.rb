# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user  # これにより、ビューでもcurrent_userを使用できるようになります
  include ApplicationHelper
  include SessionsHelper
  before_action :check_logged_in

  def check_logged_in
    return if current_user

    redirect_to home_index_path
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
