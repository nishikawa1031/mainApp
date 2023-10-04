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

User.all.each do |user|
  ## 下書きの記事
  3.times do |article|
    Article.create(
      title: "Article #{article}",
      body: "This is article number #{article}",
      comment: "This is comment number #{article}",
      status: 0,
      user:,
      start_time: Time.zone.now,
      end_time: Time.zone.now,
    )
  end

  ## 公開中の記事
  8.times do |article|
    Article.create(
      title: "Article #{article}",
      body: "This is article number #{article}",
      comment: "This is comment number #{article}",
      status: 1,
      user:,
      start_time: Time.zone.now + article.day,
      end_time: Time.zone.now + article.day,
    )

    # ブックマーク
    Bookmark.create(user_id: user.id, article_id: article) if article.even?
    # いいね
    Like.create(user_id: user.id, article_id: article) if article.odd?
  end

  ## アーカイブの記事
  Article.create(title: 'Third Article',
                 body: 'This is the third article',
                 comment: 'This is comment',
                 status: 2,
                 user_id: user,
                 start_time: Time.zone.now + 2.day,
                 end_time: Time.zone.now + 2.day,
    )
end

Article.create(
  title: 'long article',
  body: 'a' * 1000,
  comment: 'This is comment',
  status: 1,
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
  persons = Person.all.sample(rand(1..2))
  persons.each do |person|
    PersonArticle.create(article_id: article.id, person_id: person.id)
  end
end
