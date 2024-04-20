# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Unauthenticated users can only read articles
    can :read, Article

    return unless user.present?
    # All authenticated users can read their own user profile
    can :read, User, id: user.id

    # ログインしているかつ、管理者の場合
    if user&.admin?
      can :access, :rails_admin
      can :manage, :all
    elsif user.employee?
      can :read, Applicant
      can :manage, Article
    else
      can :read, Article
    end
  end
end
