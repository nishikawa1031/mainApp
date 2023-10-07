namespace :export do
    desc "Export seed data to JSON"
    task json: :environment do
      users = User.all.as_json
      articles = Article.all.as_json
      people = Person.all.as_json
      person_articles = PersonArticle.all.as_json
  
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
  