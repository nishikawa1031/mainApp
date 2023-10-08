# frozen_string_literal: true

module ApplicationHelper
  private

  def current_user?(user)
    user == current_user
  end

  def google_callback_uri
    Rails.env.production? ? 'https://www.ldocs.jp/google_login_api/callback' : 'http://localhost:3000/google_login_api/callback'
  end
end
