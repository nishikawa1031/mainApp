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
      subject: article,
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
      subject: article,
      start_time: Time.zone.now + 1.day,
      end_time: Time.zone.now + 1.day,
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
                 subject: 3,
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
  subject: 1,
  start_time: Time.zone.now + 3.day,
  end_time: Time.zone.now + 3.day,
)

# カテゴリ
Category.create(name: '山田太郎')
Category.create(name: '田中二郎')
Category.create(name: '佐藤李子')

# 記事、カテゴリのidを列挙して中間テーブルに投入
Article.all.ids.sort.each do |article_id|
  Category.all.ids.sort.each do |category_id|
    CategoryArticle.create(article_id:, category_id:)
  end
end
