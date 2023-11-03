class InputTypes::Article < Types::BaseInputObject
    graphql_name 'ArticleAttributes' # ObjectTypes::Bookと名前がバッティングしないようにする
  
    argument :body, String, required: true
    argument :user_id, Integer, required: true
    argument :start_time, String
  end