# For begginers
[for beginners](documents/for_rails_beginners/rails.md)

# How to setup
## advance preparation
### windows
[Install Ruby On Rails on Windows 11 \| GoRails](https://gorails.com/setup/windows/11#linux-subsystem)
### Mac
[Lesson 1 \- Install Rails 7 on MacOS \- YouTube](https://www.youtube.com/watch?v=rg9DCX33IDY)

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

4. run a test
If necessary, ensure that all tests PASS.
```ruby
bundle exec rspec
```
[RSpec Tutorial for Beginners \- YouTube](https://www.youtube.com/watch?v=-uhFA74eBG0)

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

# Start developing
##  Service Overview
- [about services](/documents/about.md)

## Technical Description
- [Technical Docs](documents/technical_docs/Readme.md)
