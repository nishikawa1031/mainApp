# やること
## Must
- 本番用seedデータの作成
- userのアイコン作成  ←画像生成AIとか使えないかな。
- マイページの作成

- カテゴリで、答案を選択した場合は、司法試験の問題と解説へのリンクを付与する。

- Subject関連のリファクタ
sub_headerのlinkの表示と、controllerのindexの実装、動的に生成しないと流石にsubjectが多すぎる。

- いいねした記事の一覧を見れる。
- 投稿時、カテゴリの登録ができる。
- 記事の下書き保存ができる。

- footerの記載修正
- ログイン時のcookie保存
- 広告代わりのamazonリンクの作成
- usernameカラムをURLにする。
- articleにbookmarkカラムを追加。userにもか。
user bookmarks many article
article bookmarked many users

## 最後でいい
- 企業アイコンの表示
## 後回し
- 決済機能の実装　← 勝手に値段が上がるようにしたい。
- headerの検索窓の実装
- follow/follower機能
- 変更履歴の保存
redmineみたいな感じで変更履歴が保存されるようにしたい。
https://github.com/paper-trail-gem/paper_trail
- グループだけに公開する。

# 開発関連
## エラー
### LoadError: cannot load such file -- coffee_script heroku
heroku repo:purge_cache -a main-app-1209

# レイアウトドキュメント
## card
https://getbootstrap.jp/docs/5.0/components/card/
## icon
https://fontawesome.com/search?m=free&o=r
## avatar
https://mdbootstrap.com/docs/standard/extended/avatar/


