class OpenAiController < ApplicationController
  def index
  end

  def submit
    client = OpenAI::Client.new

    # image = params[:image]
    image_path = "./app/assets/images/illustrator/404068.png"
    image_data = Base64.encode64(File.read(image_path))
    image_url = "data:image/jpeg;base64,#{image_data}"

    prompt = "
    Please return the characters or designs (CHARACTER) and the corresponding total number of spheres (TOTAL) that can be read from the image in json format.
    The csv format is as follows: key: character, total
    "

    messages = [
      { "type": "text", "text": prompt },
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

    # Parse the response JSON
    response_json = JSON.parse(@response_text)

    # Define the CSV file path
    csv_file_path = Rails.root.join('public', 'output.csv')

    # Write the JSON data to the CSV file
    CSV.open(csv_file_path, 'w') do |csv|
      # Add CSV headers
      csv << response_json.keys

      # Add CSV data
      csv << response_json.values
    end

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
