class UsersController < ApplicationController
  load_and_authorize_resource find_by: :id

  def show
    @articles = @user.articles
    @articles = @articles.page(params[:page]).per(10)
    @number_of_articles = @articles.count
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      file_path = ActiveStorage::Blob.service.send(:path_for, @user.resume.key)
      improvement_suggestions = analyze_resume(file_path)
      @response_text = improvement_suggestions
      render :show
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:resume)
  end

  def analyze_resume(file_path)
    client = OpenAI::Client.new
    file_data = Base64.encode64(File.read(file_path))
    file_url = "data:application/pdf;base64,#{file_data}"

    prompt = "Please review the attached resume and suggest improvements. Provide your response in a clear, structured format."

    messages = [
      { "type": "text", "text": prompt },
      { "type": "file_url",
        "file_url": {
          "url": file_url
        },
      }
    ]

    response = client.chat(
      parameters: {
        model: "gpt-4-vision-preview",
        messages: [{ role: "user", content: messages }],
        response_format: { type: "json_object" },
      }
    )
    response.dig("choices", 0, "message", "content")
  end
end
