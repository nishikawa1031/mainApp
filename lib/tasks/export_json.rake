# frozen_string_literal: true

# 実行方法
# rake export:json
namespace :export do
  desc 'Export seed data to JSON'
  task json: :environment do
    users = User.all.as_json(only: %i[id email username])
    articles = Article.all.as_json(only: %i[id body user_id start_time end_time])
    applicant = Person.all.as_json(only: %i[id name user_id creater_id])
    applicant_articles = PersonArticle.all.as_json(only: %i[id article_id person_id])

    data = {
      users:,
      articles:,
      applicant:,
      applicant_articles:
    }

    File.open('db/seed_data.json', 'w') do |f|
      f.write(data.to_json)
    end

    puts 'Data exported to db/seed_data.json'
  end
end
