# frozen_string_literal: true

# lib/tasks/openai_task.rake
# bundle exec rake openai:submit

namespace :openai do
  desc 'Process OpenAI API and generate CSV for each file in ./lib/assets/illustrator/'
  task submit: :environment do
    puts 'Processing OpenAI API ...'
    directory_path = './lib/assets/illustrator/'

    # ディレクトリ内の全てのファイル名を取得
    file_names = Dir.entries(directory_path).reject { |f| File.directory?(f) }

    file_names.each do |file_name|
      image_path = File.join(directory_path, file_name)

      if File.exist?(image_path)
        image_data = Base64.encode64(File.read(image_path))
        image_url = "data:image/jpeg;base64,#{image_data}"

        prompt = "
          The key of the response stores each letter of the sign and the value is the number of balls.The response must be returned in json format.
          example response:
          { 'R': 18, 'e': 14, 'f': 12, 'l': 9, 'e': 14, 'c': 10, 't': 10 }

          If there is a mark that is not a letter, key should be 'Not a letter'.
          ex. { 'Not a letter': 148, 'M': 88, 'a': 54, 'r': 28, 'u': 38, 'z': 44, 'e': 54, 'n': 39 }

          If there are identical letters, the second and subsequent letters must be followed by a number at the end of the key name.
          ex. {'H'=>47, 'A'=>49, 'M'=>57,'A2'=>49, 'M2'=>57,'A3'=>49, 'T'=>46, 'S'=>43, 'U'=>43}

          Characters may be in Chinese characters.

          The number of balls may be listed separately in one letter section. In such cases, KEY should be stated as 'part of ポ'.
          "

        messages = [
          { "type": 'text', "text": prompt },
          { "type": 'image_url',
            "image_url": {
              "url": image_url
            } }
        ]

        client = OpenAI::Client.new

        begin
          puts "Processing file: #{file_name}"
          response = client.chat(
            parameters: {
              model: 'gpt-4-vision-preview', # Required.
              messages: [{ role: 'user', content: messages }], # Required.
              response_format: { type: 'json_object' }
            }
          )

          response_text = response.dig('choices', 0, 'message', 'content')

          # Parse the response JSON
          puts response_json = JSON.parse(response_text)

          # Define the CSV file path
          csv_file_name = File.basename(file_name, File.extname(file_name))
          csv_file_path = Rails.root.join('./lib/assets/csv/after', "#{csv_file_name}.csv")

          generate_csv(csv_file_path, response_json, csv_file_name)

          puts "CSV file generated at: #{csv_file_path}"
        rescue Faraday::ResourceNotFound => e
          Rails.logger.error "Resource Not Found: #{e.message}"
          puts 'Resource Not Found: Please check your endpoint URL.'
        rescue Faraday::UnauthorizedError => e
          Rails.logger.error "Unauthorized: #{e.message}"
          puts 'Unauthorized: Please check your API key and endpoint.'
        end
      else
        puts "Image file not found: #{image_path}"
      end
    end
  end

  def project_number(file_name)
    # ファイル名からプロジェクト番号を取得
    file_name.split('_')[0]
  end

  def index(file_name)
    # ファイル名からインデックスを取得
    file_name.split('_')[1]
  end

  def generate_csv(csv_file_path, response_json, file_name)
    puts "Generating CSV file: #{csv_file_path}"
    project_number = project_number(file_name)
    index = index(file_name)
    csv_content = CSV.generate do |csv|
      # Add headers
      csv << ['file name', 'project number', 'index', 'character', 'number of ball']

      response_json.each do |char, number_of_ball|
        # Add character line
        csv << [file_name, project_number, index, char, number_of_ball]
      end
    end

    # Write the CSV content to the file
    File.write(csv_file_path, csv_content)
  end
end
