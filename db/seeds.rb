# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "test@example.com", password: "password", password_confirmation: "password")

3.times do |article|   
  Article.create(title: "Article #{article}", body: "This is article number #{article}", status: 0, user_id: 1)
end

5.times do |article|   
    Article.create(title: "Article #{article}", body: "This is article number #{article}", status: 1, user_id: 1)
end

Article.create(title: "Third Article", body: "This is the third article", status: 2, user_id: 1)

Category.create(name: "Ruby")

category_articles = CategoryArticle.create(category_id: 1, article_id: 1)