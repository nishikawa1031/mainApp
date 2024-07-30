# About
##  Service Overview
[about](/documents/en/about.md)
## Technical Description
Framework: Rails 
* https://guides.rubyonrails.org/getting_started.html
* https://www.youtube.com/watch?v=wkNR1hG4yOk&list=PLm8ctt9NhMNV75T9WYIrA6m9I_uw7vS56 

[Technical Docs](documents/technical_docs/Readme.md)

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
