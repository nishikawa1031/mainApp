# spec/mutations/create_article_spec.rb

require 'rails_helper'

module Mutations
  RSpec.describe CreateArticle, type: :request do
    describe 'resolve' do
      let(:user) { create(:user) }
      let(:article_params) do
        {
          title: 'New Article Title',
          content: 'The content of the new article.',
          user_id: user.id
        }
      end

    #   it 'creates a new article' do
    #     expect do
    #       post '/graphql', params: { query: query(article_params) }
    #     end.to change(Article, :count).by(1)
    #   end

    #   it 'returns the created article' do
    #     post '/graphql', params: { query: query(article_params) }
    #     json = JSON.parse(response.body)
    #     data = json['data']['createArticle']['article']

    #     expect(data).to include(
    #       'title' => 'New Article Title',
    #       'content' => 'The content of the new article.'
    #     )
    #   end

      context 'when invalid params are provided' do
        it 'does not create an article' do
          expect do
            post '/graphql', params: { query: query(title: '', content: '') }
          end.to_not change(Article, :count)
        end
      end
    end

    def query(params)
      <<~GRAPHQL
        mutation CreateArticle($params: InputTypes::Article!) {
          createArticle(params: $params) {
            article {
              id
              title
              content
            }
          }
        }
      GRAPHQL
    end
  end
end
