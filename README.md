# About
Framework: Rails 
* https://guides.rubyonrails.org/getting_started.html
* https://www.youtube.com/watch?v=wkNR1hG4yOk&list=PLm8ctt9NhMNV75T9WYIrA6m9I_uw7vS56

# How to setup
## local
1. Download source code
```
git clone https://github.com/nishikawa1031/mainApp
```
2. Execute command
```
bundle install
make up
```
* tips: [Makefile](/Makefile)

3. access http://localhost:8080/
* ※ auth0のcallback urlとして、設定しているため、8080でなければならない。
<details><summary>If this screen appears, you have succeeded.</summary>
<img width="1436" alt="スクリーンショット 2024-07-30 22 14 24" src="https://github.com/user-attachments/assets/753d2e88-ff63-4e1f-b2b4-3ceb715aa77a">
</details>


## docker( optional )
1. Uncomment
config/database.yml
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

# Document
https://github.com/nishikawa1031/mainApp?tab=readme-ov-file#document

[doc](/doc/)

* [controller](/doc/controllers_complete.svg)
* [model](/doc/models_complete.svg)

## DB
* [tbls](/doc/schema/README.md)
* [ER図](/erd.pdf)

# dashboard
* [Top](https://www.solution-hub.net/)
  * [herokuドメイン](https://main-app-1209-466d97d1a50c.herokuapp.com/)
* [管理画面](https://main-app-1209-466d97d1a50c.herokuapp.com/admin)
* [heroku](https://dashboard.heroku.com/apps)
* [Rollbar](https://rollbar.com/tatsunishitatsu/FirstProject/)
* [auth0](https://manage.auth0.com/dashboard/jp/dev-kg26mhb8w8f3va47/applications/hgwPE8X64zNuE6ohT8yLYftVuQkYyr7s/settings)
githubでログイン
application: Frontend

## AWS
* [S3](https://ap-northeast-1.console.aws.amazon.com/s3/home?region=ap-northeast-1#)
* [cost](https://us-east-1.console.aws.amazon.com/costmanagement/home?region=ap-northeast-1#/home)

googleログイン
* [アナリティクス](https://analytics.google.com/analytics/web/?authuser=0#/p347800174/reports/intelligenthome)
* [ドメイン](https://navi.onamae.com/domain/setting/renew/list)
* [cloudflare](https://dash.cloudflare.com/63c34c3c7777cf7a1862d682130b6293/solution-hub.net)
email認証
* [google API](https://console.cloud.google.com/apis/dashboard?project=cognito-341413)

## Design
* [Uizard](https://app.uizard.io/prototypes/BMmgKXWLm1fZ34V9yOe0)
* [canva](https://www.canva.com/)
faviconの作成
* [leonardo.ai](https://app.leonardo.ai/ai-generations)
画像生成AI
* https://www.miricanvas.com/v2/design/1364yp6
アカウント作成したのみで使っていない。

## 構成
* [draw.io](https://app.diagrams.net/#G1c-I8TScmMN83xNKbpS9RaoC_NS3x-6Zo#%7B%22pageId%22%3A%22TTj133cAQp3v-oLP87_n%22%7D)
