# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user1
user1 = User.create(email: 'test@example.com', username: 'taroyama', password: 'password',
                    password_confirmation: 'password')

# user2
user2 = User.create(email: 'another_test@example.com', username: 'another_man', password: 'password',
                    password_confirmation: 'password2')

# user3
User.create(email: 'another_test2@example.com', username: 'another_man2', password: 'password',
            password_confirmation: 'password2')

Article.create(
  body: 'a' * 1000,
  user: User.first,
  start_time: Time.zone.now + 3.day,
  end_time: Time.zone.now + 3.day,
)

historical_people = [
  { name: "織田信長", user_id: 1 },
  { name: "明智光秀", user_id: 2 },
  { name: "豊臣秀吉", user_id: 3 },
  { name: "徳川家康" },
  { name: "武田信玄" },
  { name: "上杉謙信" },
  { name: "今川義元" },
  { name: "北条氏康" }
]

historical_people.each do |person_data|
  Person.create(person_data)
end

# Historical People's Diaries
historical_diaries = {
  "織田信長" => "本能寺の変が近づいている気がする。しかし、我が野望は終わることはない。",
  "明智光秀" => "信長様との間に亀裂が生じ始めている。私の行動が日本の歴史を変えるだろうか？",
  "豊臣秀吉" => "天下統一への道は険しくも、私の策略と魅力でこれを成し遂げる。",
  "徳川家康" => "関ヶ原の戦いが成功すれば、新しい時代が始まる。平和な日本を築くための準備を始めるべきだ。",
  "武田信玄" => "風林火山。私の旗印のもと、私は今日も戦場を駆け巡る。",
  "上杉謙信" => "信玄との合戦は名将同士の戦いとなるだろう。しかし、我が信念を貫くことは譲れない。",
  "今川義元" => "桶狭間への進軍を計画中。これによって歴史がどう変わるか、楽しみである。",
  "北条氏康" => "関東地方を我が物とするため、日々策略を巡らせている。"
}

# 織田信長の日記エントリの作成
nobunaga_meeting_mitsuhide_diary = Article.create(
  body: "今日は明智光秀と重要な面会を持った。彼の策略や智慧には常に感銘を受けている。しかし、彼の瞳には未解決の謎が隠れているようにも見える。我々の関係がこれからどのように展開していくのか、興味深く思う。",
  user_id: 1, # 織田信長のuser_id
  start_time: Time.zone.now - 2.days,
  end_time: Time.zone.now - 2.days + 2.hours
)

# 明智光秀との関連付け
mitsuhide = Person.find_by(name: '明智光秀')
PersonArticle.create(article_id: nobunaga_meeting_mitsuhide_diary.id, person_id: mitsuhide.id)

