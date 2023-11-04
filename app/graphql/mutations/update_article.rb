module Mutations
    class UpdateArticle < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :params, InputTypes::Article, required: true
  
      field :article, Types::ArticleType, null: false
  
      def resolve(id:, params:)
        article = Article.find(id)
        article.update!(params.to_h)
  
        { article: article }
      rescue => e
        GraphQL::ExecutionError.new(e.message)
      end
    end
  end