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
    The key of the response stores each letter of the sign and the value is the number of balls.The response must be returned in json format.
    example response:
    { 'R': 18, 'e': 14, 'f': 12, 'l': 9, 'e': 14, 'c': 10, 't': 10 }
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
    puts response_json = JSON.parse(@response_text)

    # Define the CSV file path
    csv_file_path = Rails.root.join('public', 'output.csv')

    file_name = '404068'

    generate_csv(csv_file_path, response_json, file_name)

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

private
  # csv output
  # project number, character, number of ball
  # 404068, R, 18
  # 404068, e, 14
  # 404068, f, 12
  # 404068, l, 9
  # 404068, e, 14
  # 404068, c, 10
  # 404068, t, 10
  def generate_csv(csv_file_path, response_json, file_name)
    csv_content = CSV.generate do |csv|
      # Add headers
      csv << ['project number', 'character', 'number of ball']

      response_json.each do |char, number_of_ball|
        # Add character line
        csv << [file_name, char, number_of_ball]
      end
    end

    # Write the CSV content to the file
    File.write(csv_file_path, csv_content)
  end
