# やること
## Must
- 本番用seedデータの作成
- userのアイコン作成  ←画像生成AIとか使えないかな。
- footerの記載修正
- 全体のレイアウト修正
パスワード忘れた場合のページ
user/editページ
- 既読数、いいねが変わるように変更する。
likesカラムは、articleから削除しないとおかしい。articleとusersそれぞれが持つはずなので。
既読数カラムもいらない。qiitaにないから。

## Want
- 記事の下書き保存ができる。
- 投稿時、カテゴリの登録ができる。

- マイページの作成
- カテゴリで、答案を選択した場合は、司法試験の問題と解説へのリンクを付与する。
- faviconの作成

- articleにbookmarkカラムを追加。userにもか。
user bookmarks many article
article bookmarked many users
- いいね。bookmark機能の実装
https://techlife.cookpad.com/entry/2016/10/26/135818
- いいねした記事の一覧を見れる。

- 広告代わりのamazonリンクの作成
- userモデルに追加　twitterみたいな青バッチ作りたい
弁護士、検事、裁判官
司法試験の合格
予備試験の合格
大学院在学/卒
司法試験の順位
予備試験の順位

## 後回し
- 決済機能の実装　← 勝手に値段が上がるようにしたい。
AIに運用を任せるか、自分で値付けをするか選択できる。前者だとしても自分で修正できる。
← 憲法、民法、刑法は無料。選択科目は有料とか？
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
## クラス
https://qiita.com/nakanishi03/items/c80a16b9b9796c25f890
## card
https://getbootstrap.jp/docs/5.0/components/card/
## icon
https://fontawesome.com/search?m=free&o=r
## avatar
https://mdbootstrap.com/docs/standard/extended/avatar/


