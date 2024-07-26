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
      p "ddddxxxx"
      if @user.resume.attached?
        begin
          p @improvement_suggestions = analyze_resume(@user.resume)
          redirect_to @user, notice: '履歴書がアップロードされ、分析が完了しました。'
        rescue StandardError => e
          redirect_to @user, alert: "エラーが発生しました: #{e.message}"
        end
      else
        redirect_to @user, alert: "履歴書が添付されていません。"
      end
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:resume)
  end

  def analyze_resume(resume)
    prompt = "以下の履歴書を分析し、改善点を日本語で提案してください。回答は箇条書きで、最大5つの改善点を挙げてください。"

    AzureOpenaiService.instance.analyze_image(
      image_data: resume.download,
      prompt: prompt
    )
  end
end