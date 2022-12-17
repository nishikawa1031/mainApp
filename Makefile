# デプロイ方法
## https://main-app-1209.herokuapp.com/articles
## https://dashboard.heroku.com/apps
## https://www.figma.com/files/recent?fuid=838989140608738953
p: # pushの略
	git push origin HEAD
	git push heroku master

# 本番用コマンド
## migrateを走らせる
prod_migrate:
	heroku run rails db:migrate
	heroku run rails db:seed
	heroku run rake tmp:cache:clear

## DBリセット方法
### https://qiita.com/motoki4917/items/1bc8d539f36852abf090
prod_reset:
	heroku pg:reset DATABASE_URL
	heroku run rails db:migrate
	heroku run rails db:seed