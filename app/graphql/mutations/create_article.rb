# frozen_string_literal: true

module Mutations
  class CreateArticle < BaseMutation
    field :article, Types::ArticleType, null: true

    argument :body, String, required: false
    argument :user_id, Integer, required: false
    argument :start_time, String, required: false

    def resolve(**args)
      article = Article.create!(args)
      {
        article:
      }
    end
  end
end
