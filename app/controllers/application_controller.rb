# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  helper_method :current_user, :user_signed_in?
  include ApplicationHelper
  # include Secured
  # before_action :check_logged_in
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to '/articles'
  end

  def switch_locale
    I18n.locale = params[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
    redirect_back(fallback_location: root_path)
  end

  def check_logged_in
    return if current_user

    redirect_to home_index_path
  end

  def current_user
    @current_user ||= User.find_by(id: session[:userinfo]) if session[:userinfo]
  end

  def authorize_user
    user = User.find(params[:id]) if params[:id]
    redirect_to root_path unless user == current_user
  end

  private

  def user_signed_in?
    !!session[:userinfo]
  end

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
