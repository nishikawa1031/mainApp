# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :rolable, polymorphic: true, optional: true
  has_many :articles
  enum role: { applicant: 0, admin: 1, employee: 2 }

  has_one_attached :avatar

  class << self
    def find_or_create_from_auth(auth_hash)
      user_params = user_params_from_auth_hash(auth_hash)
      find_or_create_by(email: user_params[:email]) do |user|
        user.update!(user_params)
      end
    end

    private

    def user_params_from_auth_hash(auth_hash)
      puts auth_hash
      {
        email: auth_hash.info.name || 'default_username',
        username: auth_hash.info.nickname || 'default_username',
        role: determine_role(auth_hash),
        rolable_type: determine_rolable_type(auth_hash)
      }
    end

    def determine_role(auth_hash)
      # ロールを決定するロジック
      # 例: admin属性が存在する場合はadmin、そうでなければemployeeかapplicantなど
      if auth_hash.info.is_admin
        'admin'
      elsif auth_hash.info.is_employee
        'employee'
      else
        'applicant'
      end
    end

    def determine_rolable_type(auth_hash)
      # ロールに基づいてrolable_typeを決定
      case determine_role(auth_hash)
      when 'employee'
        'Employee' # Employeeモデルも存在する前提です
      else
        'Applicant' # 'employee' 以外はすべて 'applicant' として扱う
      end
    end
  end
end
