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
user1.avatar.attach(io: File.open(Rails.root.join('app/assets/images/avatar.jpeg')), filename: 'avatar.jpeg')

# user2
user2 = User.create(email: 'another_test@example.com', username: 'another_man', password: 'password2',
                    password_confirmation: 'password2')
user2.avatar.attach(io: File.open(Rails.root.join('app/assets/images/avatar2.jpeg')), filename: 'avatar2.jpeg')

# user3
User.create(email: 'another_test2@example.com', username: 'another_man2', password: 'password2',
            password_confirmation: 'password2')

bodies = [
  "今日は窓に雨が打ち付ける音が終わることがないような日だった。雨の音は不思議と心地よい。",
  "久しぶりにアレックスと会った。何時間も話して、学生時代を思い出したり、新しい出来事をキャッチアップしたりした。",
  "今日、「グレート・ギャツビー」を読み始めた。フィッツジェラルドの言葉の選び方には魅了される。",
  "手作りのピザ作りを試みた。結果は？今の仕事を辞めることはないと思う。",
  "「インセプション」を3回目に観た。以前の視聴時に見逃していた新しい詳細をまだ見つけている。",
  "朝に公園でランニングを楽しむという自分がいるとは思わなかったが、夜明けの公園の静けさが気を変えてくれた。",
  "今日、農民市場に行った。新鮮な野菜や手作りの商品は魅力的だった。手いっぱいの袋を持って帰った。",
  "ポーチに座って、手にはお茶を持って、私は世界が過ぎ去るのを見ながら考えにふけっていた。孤独にはある種の平和がある。"
]

User.all.each do |user|
  8.times do |i|
    Article.create(
      body: bodies[i],
      user: user,
      start_time: Time.zone.now + i.days,
      end_time: Time.zone.now + i.days + 2.hours
    )
  end
end

Article.create(
  body: 'a' * 1000,
  user: User.first,
  start_time: Time.zone.now + 3.day,
  end_time: Time.zone.now + 3.day,
)

# Person
4.times do |person|
  Person.create(name: "山田一郎", user_id: person)
  Person.create(name: "高山弘仁", user_id: person)
  Person.create(name: "川崎参", user_id: person)
  Person.create(name: '田中四郎', user_id: person)
  Person.create(name: '佐藤五郎丸')
  Person.create(name: '田辺六花')
  Person.create(name: '一河ななみ')
  Person.create(name: '田畑はち')
end

# 記事、Personのidを列挙して中間テーブルに投入
Article.all.each do |article|
  people = Person.all.sample(rand(1..2))
  people.each do |person|
    PersonArticle.create(article_id: article.id, person_id: person.id)
  end
end
