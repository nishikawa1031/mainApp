# frozen_string_literal: true

module Mutations
  class DeleteArticle < BaseMutation
    graphql_name 'DeleteArticle'

    field :article, Types::ArticleType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true

    def resolve(**args)
      article = Article.find(args[:id])
      article.destroy
      {
        article: article,
        result: article.errors.blank?
      }
    end
  end
end
