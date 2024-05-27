class OpenAiController < ApplicationController
  def index
  end

  def submit
    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
        model: "gpt-35-turbo",
        messages: [{ role: "user", content: params[:input_text] }]
      }
    )
    @response_text = response.dig("choices", 0, "message", "content")
    render "/articles/index"

  rescue Faraday::ResourceNotFound => e
    Rails.logger.error "Resource Not Found: #{e.message}"
    @response_text = "Resource Not Found: Please check your endpoint URL."
    render "/articles/index"
  rescue Faraday::UnauthorizedError => e
    Rails.logger.error "Unauthorized: #{e.message}"
    @response_text = "Unauthorized: Please check your API key and endpoint."
    render "/articles/index"
  end
end
