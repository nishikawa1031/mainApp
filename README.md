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
