# frozen_string_literal: true

module Resolvers
  class ArticlesResolver < GraphQL::Schema::Resolver
    description 'Find Articles'
    type [Types::ArticleType], null: false

    def resolve
      Article.order(start_time: :desc)
    end
  end
end
