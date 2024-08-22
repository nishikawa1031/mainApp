# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles
  enum role: { applicant: 0, admin: 1, employee: 2 }

  has_one_attached :avatar
  has_one_attached :resume # ここに追加

  class << self
    def find_or_create_from_auth(auth_hash)
      user_params = user_params_from_auth_hash(auth_hash)
      find_or_create_by(email: user_params[:email]) do |user|
        user.update(user_params)
      end
    end

    private

    def user_params_from_auth_hash(auth_hash)
      {
        email: auth_hash.info.name,
        username: auth_hash.info.nickname || 'default_username'
      }
    end
  end
end
