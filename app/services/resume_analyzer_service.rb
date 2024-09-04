# frozen_string_literal: true

# app/services/resume_analyzer_service.rb
class ResumeAnalyzerService
  def initialize(file)
    @file = file
  end

  def analyze_resume
    language = extract_language_from_request
    prompt = generate_prompt_by_language(language)

    extname = File.extname(@file.filename.to_s).downcase
    text = case extname
           when '.pdf'
             extract_text_from_pdf
           when '.docx'
             extract_text_from_docx
           else
             raise "Unsupported file type: #{@file.filename}"
           end

    Rails.logger.info("Extracted text (first 100 chars): #{text[0..99]}")

    AzureOpenaiService.instance.analyze_text(
      text:,
      prompt:
    )
  end

  private

  def extract_text_from_pdf
    reader = PDF::Reader.new(StringIO.new(@file.download))
    reader.pages.map(&:text).join("\n")
  end

  def extract_text_from_docx
    doc = Docx::Document.open(StringIO.new(@file.download))
    doc.paragraphs.map(&:text).join("\n")
  end

  def generate_prompt_by_language(language)
    case language
    when 'ja'
      '以下の履歴書を分析し、改善点を日本語で提案してください。回答は箇条書きで、最大5つの改善点を挙げてください。'
    when 'en'
      'Please analyze the following resume and suggest improvements in English. Provide up to 5 bullet points with areas of improvement.'
    when 'my'
      'ဤအကြောင်းအရာကို ချမှတ်ပါ။ မြန်မာဘာသာဖြင့် အကြံပြုချက်များကို ငွေရှင်းပါ။ ပြုပြင်စရာလိုအပ်ချက် ၅ ခုအထိ မှတ်သားပါ။'
    when 'bn'
      'অনুগ্রহ করে নিম্নলিখিত জীবনবৃত্তান্ত বিশ্লেষণ করুন এবং বাংলা ভাষায় উন্নতির পরামর্শ দিন। সর্বাধিক ৫টি উন্নতির দিকের তালিকা তৈরি করুন।'
    when 'vi'
      'Vui lòng phân tích sơ yếu lý lịch sau đây và đề xuất cải tiến bằng tiếng Việt. Đưa ra tối đa 5 gạch đầu dòng về những điểm cần cải thiện.'
    else
      'Please analyze the following resume and suggest improvements in English. Provide up to 5 bullet points with areas of improvement.'
    end
  end

  def extract_language_from_request
    lang = I18n.locale.to_s.scan(/^[a-z]{2}/).first
    %w[ja en my bn vi].include?(lang) ? lang : 'en'
  end
end
