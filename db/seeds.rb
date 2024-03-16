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
    salary_details: '年収 350万円 - 500万円',
    work_location: '神奈川県横浜市',
    employment_type: '正社員'
  },
  {
    title: 'ケアマネージャー',
    body: 'ケアマネージャー募集の詳細情報',
    user: user_care,
    company_id: company_care.id,
    language_requirement: '日本語（ネイティブレベル）',
    skills_required: '介護職員初任者研修（ヘルパー2級）以上、コミュニケーション能力',
    employment_type: '正社員、パート・アルバイト（選択可）',
    work_hours: 'シフト制（週5日、1日8時間から）'
  },
  {
    title: '工場作業員',
    body: '工場作業員募集の詳細情報',
    user: user_factory,
    company_id: company_factory.id,
    salary_details: '年収 300万円 - 450万円',
    work_location: '愛知県名古屋市',
    employment_type: '正社員'
  },
  {
    title: '機械作業技術者',
    body: '機械作業技術者募集の詳細情報',
    user: user_factory,
    company_id: company_factory.id,
    skills_required: 'CNC旋盤操作、CAD図面の読解能力',
    employment_type: '正社員',
    work_hours: '8:00 - 17:00（週5日、土日休み）'
  },
  {
    title: 'ITエンジニア',
    body: 'ITエンジニア募集の詳細情報',
    user: user_it,
    company_id: company_it.id,
    salary_details: '年収 400万円 - 600万円',
    work_location: '東京都渋谷区',
    employment_type: '正社員'
  },
  {
    title: 'シニアITエンジニア',
    body: 'シニアITエンジニア募集の詳細情報',
    user: user_it,
    company_id: company_it.id,
    skills_required: 'Java、Python、クラウドサービス（AWS/GCP/Azure）の経験',
    employment_type: '正社員',
    work_hours: '9:00 - 18:00（フレックスタイム制あり）'
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
