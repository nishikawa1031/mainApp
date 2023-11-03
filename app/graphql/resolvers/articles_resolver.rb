# frozen_string_literal: true

module Resolvers
  class ArticlesResolver < GraphQL::Schema::Resolver
    description 'Find Articles'
    type [Types::ArticleType], null: false

    def resolve
      Article.all
    end
  end
end
