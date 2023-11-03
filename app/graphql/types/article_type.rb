# frozen_string_literal: true

module Types
  class ArticleType < Types::BaseObject
    field :id, ID, null: false
    field :body, String
    field :user_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :impressions_count, Integer
    field :file, String
    field :start_time, GraphQL::Types::ISO8601DateTime
    field :end_time, GraphQL::Types::ISO8601DateTime
    field :categories, [Types::CategoryType], null: false

    field :user, UserType, null: false
    def user
      Loaders::RecordLoader.for(User).load(object.user_id)
    end

    def categories
      object.category_articles.map(&:category)
    end
  end
end
