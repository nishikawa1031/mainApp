# frozen_string_literal: true

# Create a user for testing
user1 = User.create(email: 'test@example.com')
user_care = User.create(email: 'care@example.com')
user_factory = User.create(email: 'factory@example.com')
user_it = User.create(email: 'it@example.com')

# 会社の作成
company_care = Company.create(name: '横浜介護サービス', area: 1, location: '神奈川県横浜市', website_url: 'http://care-service-yokohama.com')
company_factory = Company.create(name: '名古屋製造株式会社', area: 2, location: '愛知県名古屋市', website_url: 'http://nagoya-manufacturing.com')
company_it = Company.create(name: 'イノベーションITソリューションズ株式会社', area: 3, location: '東京都渋谷区', website_url: 'http://innovation-it-solutions.com')

# 求人記事の作成
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
  }
])
