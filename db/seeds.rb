# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user1
User.create(email: "test@example.com", username: "taroyama", password: "password", password_confirmation: "password")

## 下書きの記事
3.times do |article|   
  Article.create(
    title: "Article #{article}",
    body: "This is article number #{article}",
    status: 0,
    user: User.first,
    subject: article
  )
  end

## 公開中の記事
5.times do |article|   
  Article.create(
    title: "Article #{article}",
    body: "This is article number #{article}",
    status: 1,
    user: User.first,
    views: 10,
    likes: 2,
    subject: article
  )
end

## アーカイブの記事
Article.create(title: "Third Article",
  body: "This is the third article",
  status: 2,
  user_id: User.first,
  views: 5,
  likes: 3,
  subject: 3
)

# user2
User.create(email: "another_test@example.com", username: "another_man", password: "password2", password_confirmation: "password2")

## 下書きの記事
3.times do |article|   
  Article.create(
    title: "Article #{article}",
    body: "This is article number #{article}",
    status: 0,
    user: User.second,
    subject: article
  )
  end

## 公開中の記事
5.times do |article|   
  Article.create(
    title: "Article #{article}",
    body: "This is article number #{article}",
    status: 1,
    user: User.second,
    views: 10,
    likes: 2,
    subject: article
  )
end

## アーカイブの記事
Article.create(title: "Third Article",
  body: "This is the third article",
  status: 2,
  user_id: User.second,
  views: 5,
  likes: 3,
  subject: 5
)

# カテゴリ
Category.create(name: '民法')
Category.create(name: '刑法')
Category.create(name: '憲法')
 
# 記事、カテゴリのidを列挙して中間テーブルに投入
Article.all.ids.sort.each do |article_id|
  Category.all.ids.sort.each do |category_id|
    CategoryArticle.create(article_id: article_id, category_id: category_id)
  end
end