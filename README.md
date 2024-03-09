# setup
## docker
- uncomment
```
  # dockerを利用する際は、host,password,usernameを指定する必要がある
  host: db # docker-compose.ymlで定義したMySQLのコンテナ名
  password: password
  username: postgres
```

docker-compose build
docker-compose up
docker-compose run web rails db:seed

## tips
[Makefile](/Makefile)

## documents
[doc](/doc/)

## DB
* [tbls](/doc/schema/README.md)
* [ER図](/erd.pdf)

# dashboard
## auth0
https://manage.auth0.com/dashboard/jp/dev-kg26mhb8w8f3va47/applications/hgwPE8X64zNuE6ohT8yLYftVuQkYyr7s/settings

## heroku

