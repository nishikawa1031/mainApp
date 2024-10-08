# frozen_string_literal: true

# https://github.com/alexrudall/ruby-openai?tab=readme-ov-file#installation
OpenAI.configure do |config|
  config.access_token = ENV.fetch('AZURE_OPENAI_API_KEY', 'dummy_key')
  config.uri_base = ENV.fetch('AZURE_OPENAI_URI', 'https://dummy-uri.com')
  config.api_type = :azure
  config.api_version = '2023-03-15-preview'
  config.log_errors = true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production.
end
