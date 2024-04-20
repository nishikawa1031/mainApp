# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?
  include ApplicationHelper
  # include Secured
  # before_action :check_logged_in
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to '/home/index', alert: '画面を閲覧する権限がありません。'
  end

  def check_logged_in
    return if current_user

    redirect_to home_index_path
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:userinfo]) if session[:userinfo]
  end

  def user_signed_in?
    !!session[:userinfo]
  end
end
