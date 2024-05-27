class OpenAiController < ApplicationController
  def index
  end

  def submit
    client = OpenAI::Client.new

    # image = params[:image]
    image_path = "./app/assets/images/illustrator/404068.png"
    image_data = Base64.encode64(File.read(image_path))
    image_url = "data:image/jpeg;base64,#{image_data}"

    messages = [
      { "type": "text", "text": "画像から読み取れる、文字やデザイン(character)とそれに対応する合計の球数(total)をjson形式で返却してください"},
      { "type": "image_url",
        "image_url": {
          "url": image_url
        },
      }
    ]
    response = client.chat(
        parameters: {
            model: "gpt-4-vision-preview", # Required.
            messages: [{ role: "user", content: messages}], # Required.
            response_format: { type: "json_object" },
        })
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
