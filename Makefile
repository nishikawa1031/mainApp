# ローカル環境
up:
	bundle exec rails s

# #外部キーを明らかにし、他のカラムも表示する。
document:
	bundle exec erd --attributes=foreign_keys,content
	tbls doc --rm-dist
	bin/rake diagram:all

# デプロイ方法
## https://main-app-1209.herokuapp.com/articles
## https://dashboard.heroku.com/apps
## https://www.figma.com/files/recent?fuid=838989140608738953
p: # pushの略
	git push origin HEAD

# herokuに手動でデプロイする場合
## git push heroku master

# 本番用コマンド
## ログの確認
log:
	heroku logs --tail --app main-app-1209

console:
	heroku run console --app main-app-1209

## migrateを走らせる
prod_migrate:
	heroku run rake db:migrate --app main-app-1209
	heroku run rake tmp:cache:clear --app main-app-1209

## DBリセット方法
### https://qiita.com/motoki4917/items/1bc8d539f36852abf090

prod_reset:
	heroku run rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1 --app main-app-1209
	heroku pg:reset DATABASE_URL --confirm main-app-1209 --app main-app-1209
	heroku run rails db:migrate --app main-app-1209
# heroku run rails db:seed --app main-app-1209