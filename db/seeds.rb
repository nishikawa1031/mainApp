# frozen_string_literal: true

# Users
user1 = User.find_or_create_by!(email: 'test@example.com') do |user|
  user.password = 'password1' # 実際の環境ではセキュアなパスワードに変更してください
end
user2 = User.find_or_create_by!(email: 'another_test@example.com') do |user|
  user.password = 'password2' # 実際の環境ではセキュアなパスワードに変更してください
end

# Categories
meeting_category = Category.find_or_create_by!(name: '面会')
strategy_category = Category.find_or_create_by!(name: '戦略')
diplomacy_category = Category.find_or_create_by!(name: '外交')

# Persons
nobunaga = Person.find_or_create_by!(name: '織田信長') do |person|
  person.user_id = user1.id
  person.creater_id = user1.id # creater_id を設定
end
mitsuhide = Person.find_or_create_by!(name: '明智光秀') do |person|
  person.user_id = user2.id
  person.creater_id = user2.id # creater_id を設定
end
hideyoshi = Person.find_or_create_by!(name: '豊臣秀吉') do |person|
  person.user_id = user2.id
  person.creater_id = user2.id # creater_id を設定
end
shingen = Person.find_or_create_by!(name: '武田信玄') do |person|
  person.user_id = user2.id
  person.creater_id = user2.id # creater_id を設定
end

# Nobunaga's diary entries
nobunaga_meeting_mitsuhide_diary = Article.find_or_create_by!(
  body: '今日は明智光秀と重要な面会を持った。彼の策略や智慧には常に感銘を受けている。しかし、彼の瞳には未解決の謎が隠れているようにも見える。我々の関係がこれからどのように展開していくのか、興味深く思う。',
  user: user1,
  start_time: Time.zone.now - 2.days,
  end_time: Time.zone.now - 2.days + 2.hours
)
nobunaga_meeting_hideyoshi_diary = Article.find_or_create_by!(
  body: '今日は豊臣秀吉との重要な面会があった。彼の野心と実力は明らかで、我が信頼する部下として彼を見る。彼との共同作業はこの国の未来を形成するだろう。',
  user: user1,
  start_time: Time.zone.now - 4.days,
  end_time: Time.zone.now - 4.days + 2.hours
)
nobunaga_meeting_shingen_diary = Article.find_or_create_by!(
  body: '武田信玄との対面はいつも緊張感が走る。彼の武勇と知略は我が敵として尊敬する。しかし、彼との共闘の可能性も考えられなくはない。',
  user: user1,
  start_time: Time.zone.now - 7.days,
  end_time: Time.zone.now - 7.days + 2.hours
)

# Hideyoshi's diary entries
hideyoshi_meeting_nobunaga_diary = Article.find_or_create_by!(
  body: '今日、織田信長様との重要な会議があった。彼の大志と指導力は天下統一への道を切り開く。私はその道の一翼を担うことを誓う。',
  user: user2,
  start_time: Time.zone.now - 3.days,
  end_time: Time.zone.now - 3.days + 2.hours
)

# ... (他の 'Article' インスタンスの生成は省略しています)

# ...

# Article-Category associations
# Article-Category関連付け
Article.all.each do |article|
  article.categories << meeting_category unless article.categories.include?(meeting_category)
  article.categories << strategy_category if article.body.include?('戦略') && !article.categories.include?(strategy_category)
  article.categories << diplomacy_category if article.body.include?('外交') && !article.categories.include?(diplomacy_category)
end

# Person-Article associations
PersonArticle.find_or_create_by!(article: nobunaga_meeting_mitsuhide_diary, person: mitsuhide)
PersonArticle.find_or_create_by!(article: nobunaga_meeting_hideyoshi_diary, person: hideyoshi)
PersonArticle.find_or_create_by!(article: nobunaga_meeting_shingen_diary, person: shingen)
PersonArticle.find_or_create_by!(article: hideyoshi_meeting_nobunaga_diary, person: nobunaga)

# ... (他の 'PersonArticle' アソシエーションの生成は省略しています)

puts 'Seeds populated successfully!'
