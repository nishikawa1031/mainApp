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

# やること
本番用seedデータの作成

header色の修正
userのアイコン作成  ←画像生成AIとか使えないかな。
マイページの作成

- カテゴリで、答案を選択した場合は、司法試験の問題と解説へのリンクを付与する。

- Subject関連のリファクタ
sub_headerのlinkの表示と、controllerのindexの実装、動的に生成しないと流石にsubjectが多すぎる。

footerの記載修正
ログイン時のcookie保存
広告代わりのamazonリンクの作成

決済機能の実装　← 勝手に値段が上がるようにしたい。

- 企業アイコンの表示
- usernameカラム削除
idをusernameカラムとして扱う。マイページへのurlとかparameterに修正加える必要あるかも。
http://www.code-magagine.com/?p=697


# カラム追加
## https://qiita.com/azusanakano/items/a2847e4e582b9a627e3a
### rails generate migration AddColumnTitles
Aritcle like, views: number

# 後回し
headerの検索窓の実装
follow/follower機能

# 大まかな実装の順番
## 新規作成 ←最もこだわりたい部分。
投稿時、カテゴリの登録ができる。
記事の下書き保存ができる。
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

