# frozen_string_literal: true

# Create users
user1 = User.find_or_create_by(email: 'test@example.com', username: 'test_username')
user_care = User.find_or_create_by(email: 'care@example.com', username: 'care_username')
user_factory = User.find_or_create_by(email: 'factory@example.com', username: 'factory_username')
user_it = User.find_or_create_by(email: 'it@example.com', username: 'it_username')

# Create companies
company_care = Company.create(name: '横浜介護サービス', area: 1, location: '神奈川県横浜市', website_url: 'http://care-service-yokohama.com')
company_factory = Company.create(name: '名古屋製造株式会社', area: 2, location: '愛知県名古屋市', website_url: 'http://nagoya-manufacturing.com')
company_it = Company.create(name: 'イノベーションITソリューションズ株式会社', area: 3, location: '東京都渋谷区', website_url: 'http://innovation-it-solutions.com')

# Create articles
Article.create([
  {
    title: '介護職員',
    body: '介護職員募集の詳細情報',
    user: user_care,
    company_id: company_care.id,
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
    title: 'ケアマネージャー',
    body: 'ケアマネージャー募集の詳細情報',
    user: user_care,
    company_id: company_care.id,
    language_requirement: '日本語（ネイティブレベル）',
    skills_required: '介護職員初任者研修（ヘルパー2級）以上、コミュニケーション能力',
    employment_type: '正社員、パート・アルバイト（選択可）',
    work_hours: 'シフト制（週5日、1日8時間から）',
    start_date: '募集開始日',
    end_date: '募集終了日',
    salary: '給与条件',
    location: '勤務地'
  },
  {
    title: '工場作業員',
    body: '工場作業員募集の詳細情報',
    user: user_factory,
    company_id: company_factory.id,
    salary_details: '年収 300万円 - 50万円',
    work_location: '愛知県名古屋市',
    employment_type: '正社員',
    language_requirement: '日本語（ネイティブレベル）',
    skills_required: '工場作業経験、体力、コミュニケーション能力',
    work_hours: 'シフト制（週5日、1日8時間から）',
    start_date: '募集開始日',
    end_date: '募集終了日',
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
    user: user_factory,
    company_id: company_factory.id,
    skills_required: 'CNC旋盤操作、CAD図面の読解能力',
    employment_type: '正社員',
    work_hours: '8:00 - 17:00（週5日、土日休み）',
    language_requirement: '日本語（ビジネスレベル）',
    work_location: '愛知県名古屋市',
    start_date: '即時',
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
    user: user_it,
    company_id: company_it.id,
    skills_required: 'Java、Python、クラウドサービス（AWS/GCP Azure）の経験',
    employment_type: '正社員',
    work_hours: '9:00 - 18:00（フレックスタイム制あり）',
    language_requirement: '日本語（ビジネスレベル）、英語（ビジネスレベル）',
    work_location: '東京都渋谷区',
    start_date: '即時',
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
    user: user_it,
    company_id: company_it.id,
    salary_details: '年収 400万円 - 600万円',
    work_location: '東京都渋谷区',
    employment_type: '正社員',
    language_requirement: '日本語（ビジネスレベル）、英語（ビジネスレベル）',
    skills_required: 'プログラミング言語の習熟（Java、Pythonなど）、システム開発経験',
    work_hours: '10:00 - 19:00（週5日）',
    start_date: '即時',
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
    user: user1,
    company_id: company_care.id,
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
categories = ['介護', '製造', 'IT']
categories.each do |name|
  Category.create(name: name)
end

# Assign categories to articles
Article.all.each_with_index do |article, index|
  article.categories << Category.find_by(name: categories[index % 3]) # Cycling through categories
end

# Create bookmarks
Bookmark.create([
  { user: user1, article: Article.last },
  { user: user_care, article: Article.first },
  { user: user_factory, article: Article.third },
  { user: user_it, article: Article.fifth }
])

# Create likes
Like.create([
  { user: user1, article: Article.last },
  { user: user_care, article: Article.first },
  { user: user_factory, article: Article.third },
  { user: user_it, article: Article.fifth }
])

# Create applicants
applicant1 = Applicant.find_or_create_by(
  name: 'John Doe',
  user_id: user1.id,
  creater_id: user1.id,
  birthday: Date.new(1990, 5, 10),
  age: 32,
  nationality: 1,
  phone_number: 1234,
  self_introduction: 'I have experience in caregiving.',
  desired_salary: '¥400,000'
)
applicant2 = Applicant.find_or_create_by(
  name: 'Jane Smith',
  user_id: user_care.id,
  creater_id: user_care.id,
  birthday: Date.new(1985, 8, 20),
  age: 37,
  nationality: 2,
  phone_number: 9876,
  self_introduction: 'I am a certified care manager with 5 years of experience.', 
  desired_salary: '¥450,000'
)

applicant3 = Applicant.find_or_create_by(
  name: 'Robert Johnson',
  user_id: user_factory.id,
  creater_id: user_factory.id,
  birthday: Date.new(1992, 3, 15),
  age: 30,
  nationality: 3,
  phone_number: 5551,
  self_introduction: 'I have worked in manufacturing for 5 years.',
  desired_salary: '¥500,000'
)

# Create applicant articles
ApplicantArticle.create([
  { applicant: applicant1, article: Article.first },
  { applicant: applicant2, article: Article.second },
  { applicant: applicant3, article: Article.third }
])
