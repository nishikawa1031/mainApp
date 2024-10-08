# frozen_string_literal: true

# Create applicants
applicant1 = Applicant.find_or_create_by(
  name: 'John Doe',
  birthday: Date.new(1990, 5, 10),
  age: 32,
  nationality: 1,
  phone_number: '1234',
  self_introduction: 'I have experience in caregiving.',
  desired_salary: '¥400,000'
)
resume_path = Rails.root.join('db/seeds/files/sample_resume1.pdf')
applicant1.files.attach(io: File.open(resume_path), filename: 'sample_resume1.pdf', content_type: 'application/pdf')

applicant2 = Applicant.find_or_create_by(
  name: 'Jane Smith',
  birthday: Date.new(1985, 8, 20),
  age: 37,
  nationality: 2,
  phone_number: '9876',
  self_introduction: 'I am a certified care manager with 5 years of experience.',
  desired_salary: '¥450,000'
)
resume_path = Rails.root.join('db/seeds/files/sample_resume2.docx')
applicant2.files.attach(
  io: File.open(resume_path),
  filename: 'sample_resume2.docx',
  content_type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
)

applicant3 = Applicant.find_or_create_by(
  name: 'Robert Johnson',
  birthday: Date.new(1992, 3, 15),
  age: 30,
  nationality: 3,
  phone_number: '5551',
  self_introduction: 'I have worked in manufacturing for 5 years.',
  desired_salary: '¥500,000'
)

# Create users
user1 = User.find_or_create_by(email: 'test@example.com', username: 'test_username') do |user|
  user.role = :admin
  user.rolable = applicant1
end
user1.avatar.attach(io: File.open(Rails.root.join('db', 'seeds', 'images', 'avatar1.jpg')), filename: 'avatar1.jpg')

user_care = User.find_or_create_by(email: 'care@example.com', username: 'care_username') do |user|
  user.role = :employee
  user.rolable = applicant2
end
user_care.avatar.attach(io: File.open(Rails.root.join('db', 'seeds', 'images', 'avatar2.jpg')), filename: 'avatar2.jpg')

user_factory = User.find_or_create_by(email: 'factory@example.com', username: 'factory_username') do |user|
  user.role = :employee
  user.rolable = applicant3
end
user_factory.avatar.attach(io: File.open(Rails.root.join('db', 'seeds', 'images', 'avatar3.jpg')), filename: 'avatar3.jpg')

user_it = User.find_or_create_by(email: 'it@example.com', username: 'it_username') do |user|
  user.role = :employee
end
user_it.avatar.attach(io: File.open(Rails.root.join('db', 'seeds', 'images', 'avatar_it.jpg')), filename: 'avatar_it.jpg')

# applicant_it = User.find_or_create_by(email: 'applicant_it@example.com', username: 'applicant_it_username') do |user|
#   user.role = :applicant
#   user.rolable = applicant1
# end

# applicant_care = User.find_or_create_by(email: 'applicant_care@example.com', username: 'applicant_care_username') do |user|
#   user.role = :applicant
#   user.rolable = applicant2
# end

# applicant_factory = User.find_or_create_by(email: 'user_factory@example.com', username: 'user_factory_username') do |user|
#   user.role = :applicant
#   user.rolable = applicant3
# end

# Create companies
Company.create(name: '横浜介護サービス', area: 1, location: '神奈川県横浜市', website_url: 'http://care-service-yokohama.com')
Company.create(name: '名古屋製造株式会社', area: 2, location: '愛知県名古屋市', website_url: 'http://nagoya-manufacturing.com')
Company.create(name: 'イノベーションITソリューションズ株式会社', area: 3, location: '東京都渋谷区', website_url: 'http://innovation-it-solutions.com')

# Create articles
Article.create([
                 {
                   user_id: user_care.id,
                   title: '介護職員',
                   body: '介護職員募集の詳細情報',
                   start_time: '現在の日時',
                   end_time: '現在の日時 + 1か月',
                   salary_details: '年収 350万円 - 500万円',
                   work_location: '神奈川県横浜市',
                   language_requirement: '日本語（ネイティブレベル）',
                   japanese_level: 'N1',
                   skills_required: '介護経験、コミュニケーションスキル',
                   employment_type: '正社員',
                   description: 'この職位では、お客様の自宅での介護が必要です。',
                   work_hours: '午前9時 - 午後6時',
                   trial_period: '3か月',
                   days_off: '日曜日',
                   overtime: '有給残業あり',
                   transportation: '提供されません',
                   work_environment: '在宅介護',
                   other_allowances: 'なし',
                   insurance: '健康保険提供',
                   other_benefits: '年次ボーナス',
                   status: 1
                 },
                 {
                   user_id: user_care.id,
                   title: 'ケアマネージャー',
                   body: 'ケアマネージャー募集の詳細情報',
                   language_requirement: '日本語（ネイティブレベル）',
                   skills_required: '介護職員初任者研修（ヘルパー2級）以上、コミュニケーション能力',
                   employment_type: '正社員、パート・アルバイト（選択可）',
                   work_hours: 'シフト制（週5日、1日8時間から）',
                   start_time: '募集開始日',
                   end_time: '募集終了日',
                   salary_details: '月給制、経験・能力に応じて優遇',
                   work_location: '愛知県名古屋市',
                   description: '高齢者や障がい者などのケアプランの作成やサポートを担当します。',
                   trial_period: '3か月',
                   days_off: 'シフトによる',
                   overtime: '時給の25%増し',
                   transportation: '自己負担',
                   work_environment: '介護施設内',
                   other_allowances: '通勤手当',
                   insurance: '健康保険、厚生年金、雇用保険提供',
                   other_benefits: '年次有給休暇、昇給制度あり',
                   status: 1
                 },
                 {
                   user_id: user_factory.id,
                   title: '工場作業員',
                   body: '工場作業員募集の詳細情報',
                   salary_details: '年収 300万円 - 50万円',
                   work_location: '愛知県名古屋市',
                   employment_type: '正社員',
                   language_requirement: '日本語（ネイティブレベル）',
                   skills_required: '工場作業経験、体力、コミュニケーション能力',
                   work_hours: 'シフト制（週5日、1日8時間から）',
                   start_time: '募集開始日',
                   end_time: '募集終了日',
                   description: '製造工程に従事し、製品の生産を担当します。',
                   trial_period: '3か月',
                   days_off: 'シフトによる',
                   overtime: '時給の25%増し',
                   transportation: '自己負担',
                   work_environment: '工場内',
                   other_allowances: '通勤手当',
                   insurance: '健康保険、厚生年金、雇用保険提供',
                   other_benefits: '年次有給休暇、昇給制度あり',
                   status: 1
                 },
                 {
                   title: '機械作業技術者',
                   body: '機械作業技術者募集の詳細情報',
                   user_id: user_factory.id,
                   skills_required: 'CNC旋盤操作、CAD図面の読解能力',
                   employment_type: '正社員',
                   work_hours: '8:00 - 17:00（週5日、土日休み）',
                   language_requirement: '日本語（ビジネスレベル）',
                   work_location: '愛知県名古屋市',
                   start_time: '即時',
                   salary_details: '年収 400万円 - 600万円',
                   description: '工場内で機械作業を担当し、生産ラインの効率化に貢献します。',
                   trial_period: '3か月',
                   days_off: '土日祝日',
                   overtime: '時給の25%増し',
                   transportation: '自己負担',
                   work_environment: '工場内',
                   other_allowances: '通勤手当',
                   insurance: '健康保険、厚生年金、雇用保険提供',
                   other_benefits: '年次有給休暇、昇給制度あり',
                   status: 1
                 },
                 {
                   title: 'シニアITエンジニア',
                   body: 'シニアITエンジニア募集の詳細情報',
                   user_id: user_it.id,
                   skills_required: 'Java、Python、クラウドサービス（AWS/GCP Azure）の経験',
                   employment_type: '正社員',
                   work_hours: '9:00 - 18:00（フレックスタイム制あり）',
                   language_requirement: '日本語（ビジネスレベル）、英語（ビジネスレベル）',
                   work_location: '東京都渋谷区',
                   start_time: '即時',
                   salary_details: '年収 600万円 - 900万円',
                   description: '高度なITシステムの設計・開発やプロジェクトマネジメントを担当します。',
                   trial_period: '3か月',
                   days_off: '土日祝日',
                   overtime: '時給の25%増し',
                   transportation: '自己負担',
                   work_environment: 'オフィス内',
                   other_allowances: '通勤手当',
                   insurance: '健康保険、厚生年金、雇用保険提供',
                   other_benefits: '年次有給休暇、昇給制度あり',
                   status: 1
                 },
                 {
                   title: 'ITエンジニア',
                   body: 'ITエンジニア募集の詳細情報',
                   user_id: user_it.id,
                   salary_details: '年収 400万円 - 600万円',
                   work_location: '東京都渋谷区',
                   employment_type: '正社員',
                   language_requirement: '日本語（ビジネスレベル）、英語（ビジネスレベル）',
                   skills_required: 'プログラミング言語の習熟（Java、Pythonなど）、システム開発経験',
                   work_hours: '10:00 - 19:00（週5日）',
                   start_time: '即時',
                   description: 'ITシステムの開発や保守、問題解決を担当します。',
                   trial_period: '3か月',
                   days_off: '土日祝日',
                   overtime: '時給の25%増し',
                   transportation: '自己負担',
                   work_environment: 'オフィス内',
                   other_allowances: '通勤手当',
                   insurance: '健康保険、厚生年金、雇用保険提供',
                   other_benefits: '年次有給休暇、昇給制度あり',
                   status: 1
                 },
                 {
                   title: 'Caregiver Wanted',
                   body: 'We are looking for a caregiver with experience in elderly care.',
                   user_id: user1.id,
                   start_time: DateTime.now,
                   end_time: DateTime.now + 1.month,
                   salary_details: '¥350,000 - ¥450,000 per year',
                   work_location: 'Yokohama, Kanagawa',
                   language_requirement: 'Japanese (Native level)',
                   japanese_level: 'N1',
                   skills_required: 'Elderly care experience, good communication skills',
                   employment_type: 'Full-time',
                   description: 'This position requires providing care for elderly clients in their homes.',
                   work_hours: '9:00 AM - 6:00 PM',
                   trial_period: '3 months',
                   days_off: 'Sundays',
                   overtime: 'Paid overtime available',
                   transportation: 'Not provided',
                   work_environment: 'Home care',
                   other_allowances: 'None',
                   insurance: 'Health insurance provided',
                   other_benefits: 'Annual bonus',
                   status: 1
                 }
               ])

# Create categories
categories = %w[介護 製造 IT]
categories.each do |name|
  Category.create(name:)
end

# Assign categories to articles
Article.all.each_with_index do |article, index|
  article.categories << Category.find_by(name: categories[index % 3]) # Cycling through categories
end

# Create applicant articles
ApplicantArticle.create([
                          { applicant: applicant1, article: Article.first },
                          { applicant: applicant2, article: Article.second },
                          { applicant: applicant3, article: Article.third }
                        ])
