# frozen_string_literal: true

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
          p @improvement_suggestions = analyze_resume(@applicant.files.last)
          redirect_to user_path(@applicant.user), notice: '履歴書がアップロードされ、分析が完了しました。', status: :see_other
        rescue StandardError => e
          redirect_to @applicant.user, alert: "エラーが発生しました: #{e.message}"
        end
      else
        redirect_to @applicant.user, alert: '履歴書が添付されていません。'
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

  # Use callbacks to share common setup or constraints between actions.
  def set_applicant
    @applicant = Applicant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
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

  def extract_text_from_pdf(file)
    reader = PDF::Reader.new(StringIO.new(file.download))
    reader.pages.map(&:text).join("\n")
  end

  def extract_text_from_docx(file)
    doc = Docx::Document.open(StringIO.new(file.download))
    doc.paragraphs.map(&:text).join("\n")
  end

  def analyze_resume(file)
    prompt = '以下の履歴書を分析し、改善点を日本語で提案してください。回答は箇条書きで、最大5つの改善点を挙げてください。'

    extname = File.extname(file.filename.to_s).downcase
    text = case extname
           when '.pdf'
             extract_text_from_pdf(file)
           when '.docx'
             extract_text_from_docx(file)
           else
             raise "Unsupported file type: #{file.filename}"
           end

    Rails.logger.info("Extracted text (first 100 chars): #{text[0..99]}")

    AzureOpenaiService.instance.analyze_text(
      text:,
      prompt:
    )
  end
end
