# 実行方法
# rake export:json
namespace :export do
    desc "Export seed data to JSON"
    task json: :environment do
      users = User.all.as_json(only: [:id, :email, :username])
      articles = Article.all.as_json(only: [:id, :body, :user_id, :start_time, :end_time])
      people = Person.all.as_json(only: [:id, :name, :user_id, :creater_id])
      person_articles = PersonArticle.all.as_json(only: [:id, :article_id, :person_id])
  
      data = {
        users: users,
        articles: articles,
        people: people,
        person_articles: person_articles
      }
  
      File.open("db/seed_data.json", "w") do |f|
        f.write(data.to_json)
      end
  
      puts "Data exported to db/seed_data.json"
    end
  end
  