module Resolvers
    class ArticleResolver < GraphQL::Schema::Resolver
      description 'Find a article by ID'
      type Types::ArticleType, null: false
  
      argument :id, ID, required: true
  
      def resolve(id:)
        Article.find(id)
      end
    end
  end