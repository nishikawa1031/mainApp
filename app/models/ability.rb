# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Unauthenticated users can only read articles
    can :read, Article

    return unless user.present?

    # Allow users to read and update their own profile
    can %i[read update], User, id: user.id

    # ログインしているかつ、管理者の場合
    if user&.admin?
      can :access, :rails_admin
      can :manage, :all
    elsif user.employee?
      can :read, Applicant
      can :manage, Article
    else
      can :read, Article
      can :manage, Applicant, user_id: user.id
      cannot :read, Applicant, user_id: !user.id
      cannot :update, Applicant, user_id: !user.id
    end
  end
end
