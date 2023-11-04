# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_article, mutation: Mutations::DeleteArticle
    field :create_article, mutation: Mutations::CreateArticle
    field :update_article, mutation: Mutations::UpdateArticle
    field :create_user, mutation: Mutations::CreateUser
  end
end
