# frozen_string_literal: true

# Users
users_data = [
  { email: 'test@example.com' },
  { email: 'another_test@example.com' }
]

users = users_data.map do |user_data|
  User.find_or_create_by!(email: user_data[:email])
end

# Categories
categories_data = ['面会', '戦略', '外交']
categories = categories_data.map do |category_name|
  Category.find_or_create_by!(name: category_name)
end

# Persons
persons_data = [
  { name: '織田信長', user: users[0] },
  { name: '明智光秀', user: users[1] },
  { name: '豊臣秀吉', user: users[1] },
  { name: '武田信玄', user: users[1] }
]

persons = persons_data.map do |person_data|
  Person.find_or_create_by!(name: person_data[:name]) do |person|
    person.user_id = person_data[:user]
    person.creater_id = person_data[:user].id
  end
end

# Diary entries
nobunaga_meets_mitsuhide = <<~BODY
  今日は明智光秀と重要な面会を持った。彼の策略や智慧には常に感銘を受けている。しかし、彼の瞳には未解決の謎が隠れているようにも見える。
  我々の関係がこれからどのように展開していくのか、興味深く思う。
BODY

nobunaga_meets_hideyoshi = <<~BODY
  今日は豊臣秀吉との重要な面会があった。彼の野心と実力は明らかで、我が信頼する部下として彼を見る。
  彼との共同作業はこの国の未来を形成するだろう。
BODY

nobunaga_meets_shingen = <<~BODY
  武田信玄との対面はいつも緊張感が走る。彼の武勇と知略は我が敵として尊敬する。
  しかし、彼との共闘の可能性も考えられなくはない。
BODY

hideyoshi_meets_nobunaga = <<~BODY
  今日、織田信長様との重要な会議があった。彼の大志と指導力は天下統一への道を切り開く。
  私はその道の一翼を担うことを誓う。
BODY

diary_entries_data = [
  { body: nobunaga_meets_mitsuhide, user: users[0], person: persons[1], categories: [categories[0]] },
  { body: nobunaga_meets_hideyoshi, user: users[0], person: persons[2], categories: [categories[0]] },
  { body: nobunaga_meets_shingen, user: users[0], person: persons[3], categories: [categories[0]] },
  { body: hideyoshi_meets_nobunaga, user: users[1], person: persons[0], categories: [categories[0]] }
]

diary_entries_data.each do |entry_data|
  article = Article.find_or_create_by!(
    body: entry_data[:body],
    user: entry_data[:user],
    start_time: Time.zone.now - 2.days,
    end_time: Time.zone.now - 2.days + 2.hours
  )

  entry_data[:categories].each do |category|
    article.categories << category unless article.categories.include?(category)
  end

  PersonArticle.find_or_create_by!(article: article, person: entry_data[:person])
end

puts 'Seeds populated successfully!'
