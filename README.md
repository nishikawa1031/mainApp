# デプロイ方法
git push heroku master
heroku run rails db:migrate
heroku run rails db:seed
heroku run rake tmp:cache:clear

https://main-app-1209.herokuapp.com/articles
https://dashboard.heroku.com/apps
https://www.figma.com/files/recent?fuid=838989140608738953

## DBリセット方法
heroku pg:reset DATABASE_URL
https://qiita.com/motoki4917/items/1bc8d539f36852abf090

## エラー
### LoadError: cannot load such file -- coffee_script heroku
heroku repo:purge_cache -a main-app-1209

# レイアウトドキュメント
## card
https://getbootstrap.jp/docs/5.0/components/card/

# やること
headerの検索窓の実装
# 大まかな実装の順番
## ページ構成
記事の一覧ページ(ホーム画面)
記事の詳細ページ
記事の新規作成・編集　ログイン済みユーザーのみ
記事に対するブックマーク

## 新規作成 ←最もこだわりたい部分。
投稿時、カテゴリの登録ができる。
記事の下書き保存ができる。
### 入力方法は、markdown?
WYSIWYG
https://qiita.com/mgmgmogumi/items/06b12e7f09a8d9041caa

TINYMCE
https://github.com/spohlenz/tinymce-rails


## 下書き保存したページ一覧
statusがdraftのページだけをページ一覧に表示するだけ。

## マイページ
いいねした記事の一覧を見れる。

## 認証機能の実装
https://qiita.com/taki_21/items/cc8bc157d5742294ec98
認証済みユーザーかどうかで表示できるページ制御。
https://qiita.com/ren0826jam/items/eaa3e5b6d16cc22c4179

## 変更履歴の保存
redmineみたいな感じで変更履歴が保存されるようにしたい。
https://github.com/paper-trail-gem/paper_trail
