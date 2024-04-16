# setup
## local
1. bundle install
2. make up

## docker
1. Uncomment
```
  # dockerを利用する際は、host,password,usernameを指定する必要がある
  host: db # docker-compose.ymlで定義したMySQLのコンテナ名
  password: password
  username: postgres
```
2. setup docker
```
docker-compose build
docker-compose up
docker-compose run web rails db:seed
```

## tips
[Makefile](/Makefile)

# Document
https://github.com/nishikawa1031/mainApp?tab=readme-ov-file#document

[doc](/doc/)

* [controller](/doc/controllers_complete.svg)
* [model](/doc/models_complete.svg)

## DB
* [tbls](/doc/schema/README.md)
* [ER図](/erd.pdf)

# dashboard
* [Top](https://main-app-1209-466d97d1a50c.herokuapp.com/)
* [管理画面](https://main-app-1209-466d97d1a50c.herokuapp.com/admin)
* [heroku](https://dashboard.heroku.com/apps)
* [Rollbar](https://rollbar.com/tatsunishitatsu/FirstProject/)
* [auth0](https://manage.auth0.com/dashboard/jp/dev-kg26mhb8w8f3va47/applications/hgwPE8X64zNuE6ohT8yLYftVuQkYyr7s/settings)

## AWS
* [S3](https://ap-northeast-1.console.aws.amazon.com/s3/home?region=ap-northeast-1#)
* [cost](https://us-east-1.console.aws.amazon.com/costmanagement/home?region=ap-northeast-1#/home)

googleログイン
* [アナリティクス](https://analytics.google.com/analytics/web/?authuser=0#/p347800174/reports/intelligenthome)
* [ドメイン](https://navi.onamae.com/domain/setting/renew/list)
* [google API](https://console.cloud.google.com/apis/dashboard?project=cognito-341413)