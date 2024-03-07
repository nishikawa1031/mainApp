# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles
  enum role: { general: 0, admin: 1 }

  class << self
    def find_or_create_from_auth(auth_hash)
      user_params = user_params_from_auth_hash(auth_hash)
      find_or_create_by(email: user_params[:email]) do |user|
        # user.update(user_params)
      end
    end

    private

    def user_params_from_auth_hash(auth_hash)
      {
        email: auth_hash.info.name
      }
    end
  end
end
