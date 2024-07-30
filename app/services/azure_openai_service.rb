# frozen_string_literal: true

class AzureOpenaiService
  include Singleton

  MAX_RETRIES = 3
  RETRY_DELAY = 5 # seconds

  def initialize
    @client = OpenAI::Client.new
  end

  def chat(messages:, model: 'gpt-4-vision-preview', **options)
    retries = 0
    begin
      response = @client.chat(
        parameters: {
          model:,
          messages:,
          **options
        }
      )
      response.dig('choices', 0, 'message', 'content')
    rescue OpenAI::Error => e
      if e.message.include?('429') && retries < MAX_RETRIES
        retries += 1
        sleep_time = calculate_backoff(retries)
        Rails.logger.warn "Rate limit exceeded. Retrying in #{sleep_time} seconds. Attempt #{retries}/#{MAX_RETRIES}"
        sleep sleep_time
        retry
      else
        handle_error(e)
      end
    end
  end

  def analyze_image(image_data:, prompt:)
    file_url = Base64.encode64(image_data)
    messages = [
      { role: 'user', content: [
        { type: 'text', text: prompt },
        { type: 'image_url', image_url: { url: file_url } }
      ] }
    ]

    chat(messages:, model: ENV['AZURE_OPENAI_VISION_DEPLOYMENT_NAME'])
  end

  private

  def calculate_backoff(retry_count)
    [RETRY_DELAY * (2**(retry_count - 1)), 60].min # Max 60 seconds
  end

  def handle_error(error)
    Rails.logger.error "Azure OpenAI API Error: #{error.message}"
    raise RateLimitExceededError, 'Azure OpenAI APIのレート制限に達しました。しばらく待ってから再試行してください。' if error.message.include?('429')

    raise AzureOpenAIApiError, "Azure OpenAI APIでエラーが発生しました: #{error.message}"
  end
end
