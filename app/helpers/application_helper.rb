# frozen_string_literal: true

module ApplicationHelper
  private

  def current_user?(user)
    user == current_user
  end

  def google_callback_uri
    Rails.env.production? ? 'https://www.ldocs.jp/google_login_api/callback' : 'http://localhost:3000/google_login_api/callback'
  end

  def authenticate_user!
    redirect_to home_index_path unless current_user
    #ユーザーがログインしていない限り、ログイン画面にレダイレクトする
  end
end
