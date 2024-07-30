require 'openai'

OpenAI.configure do |config|
  config.access_token = ENV['AZURE_OPENAI_API_KEY']
  config.uri_base = ENV['AZURE_OPENAI_URI']
  config.api_type = :azure
  config.api_version = '2023-05-15' # Azure OpenAIの最新バージョンを使用
end
