# app/controllers/applicants_controller.rb
class ApplicantsController < ApplicationController
  load_and_authorize_resource

  before_action :set_applicant, only: %i[show edit update destroy]

  # GET /applicants
  def index
    @applicants = Applicant.all
  end

  # GET /applicants/1
  def show; end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  # GET /applicants/1/edit
  def edit; end

  # POST /applicants
  def create
    @applicant = Applicant.new(applicant_params)

    if @applicant.save
      redirect_to @applicant, notice: 'Applicant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applicants/1
  def update
    if @applicant.update(applicant_params)
      if @applicant.files.attached?
        begin
          analyzer = ResumeAnalyzerService.new(@applicant.files.last)
          @improvement_suggestions = analyzer.analyze_resume
          flash[:success] = '履歴書がアップロードされ、分析が完了しました。'
          @user = @applicant.user
          render 'users/show'
        rescue StandardError => e
          flash[:alert] = "エラーが発生しました: #{e.message}"
          render :edit, status: :unprocessable_entity
        end
      else
        flash[:alert] = '履歴書が添付されていません。'
        render :edit, status: :unprocessable_entity
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /applicants/1
  def destroy
    @applicant.destroy
    redirect_to applicants_url, notice: 'Applicant was successfully destroyed.', status: :see_other
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  def applicant_params
    params.require(:applicant).permit(:name,
                                      :user_id,
                                      :creater_id,
                                      :birthday,
                                      :age,
                                      :nationality,
                                      :phone_number,
                                      :self_introduction,
                                      :desired_salary,
                                      :resume,
                                      files: [])
  end
end
