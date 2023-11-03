# frozen_string_literal: true

module Mutations
  class CreateArticle < BaseMutation
    argument :params, InputTypes::Article, required: true
    field :article, Types::ArticleType, null: true

    argument :body, String, required: false
    argument :user_id, Integer, required: false
    argument :start_time, String, required: false

    def resolve(params:)
      article = Article.create!(params.to_h)
      {
        article:
      }
    end
  end
end
