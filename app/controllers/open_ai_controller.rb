# frozen_string_literal: true

class OpenAiController < ApplicationController
  const PROMPT = "
  The key of the response stores each letter of the sign and the value is the number of balls.The response must be returned in json format.
  example response:
  { 'R': 18, 'e': 14, 'f': 12, 'l': 9, 'e': 14, 'c': 10, 't': 10 }

  If there is a mark that is not a letter, key should be 'Not a letter'.
  ex. { 'Not a letter': 148, 'M': 88, 'a': 54, 'r': 28, 'u': 38, 'z': 44, 'e': 54, 'n': 39 }

  If there are identical letters, the second and subsequent letters must be followed by a number at the end of the key name.
  ex. {'H'=>47, 'A'=>49, 'M'=>57,'A2'=>49, 'M2'=>57,'A3'=>49, 'T'=>46, 'S'=>43, 'U'=>43}
  "

  def index; end

  def submit
    client = OpenAI::Client.new

    # image = params[:image]
    file_name = '404068'
    image_path = "./app/assets/images/illustrator/#{file_name}.png"
    image_data = Base64.encode64(File.read(image_path))
    image_url = "data:image/jpeg;base64,#{image_data}"

    messages = [
      { "type": 'text', "text": PROMPT },
      { "type": 'image_url',
        "image_url": {
          "url": image_url
        } }
    ]
    response = client.chat(
      parameters: {
        model: 'gpt-4-vision-preview', # Required.
        messages: [{ role: 'user', content: messages }], # Required.
        response_format: { type: 'json_object' }
      }
    )
    @response_text = response.dig('choices', 0, 'message', 'content')

    # Parse the response JSON
    puts response_json = JSON.parse(@response_text)

    # Define the CSV file path
    csv_file_path = Rails.root.join('./app/assets/images/csv/after', "#{file_name}.csv")

    generate_csv(csv_file_path, response_json, file_name)

    render '/articles/index'
  rescue Faraday::ResourceNotFound => e
    Rails.logger.error "Resource Not Found: #{e.message}"
    @response_text = 'Resource Not Found: Please check your endpoint URL.'
    render '/articles/index'
  rescue Faraday::UnauthorizedError => e
    Rails.logger.error "Unauthorized: #{e.message}"
    @response_text = 'Unauthorized: Please check your API key and endpoint.'
    render '/articles/index'
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
