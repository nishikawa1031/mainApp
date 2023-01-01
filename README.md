# やること
## Must
- 本番用seedデータの作成

## 本番運用するなら
- ログインがメール送信も存在しないのはおかしい。
https://zenn.dev/yoiyoicho/articles/974c73ac75c100
line loginでアイコン取得できるらしい。
google
facebook
twitter

- S3と接続
- レンタルサーバー契約、ドメイン取得
- heroku内で、開発環境と本番環境を用意する
https://engineer.crowdworks.jp/entry/2016/09/05/154304

## Want
- 運用費と収入を全ユーザーが見えるようにしたい
サーバー代、ドメイン代
- いいねのアイコン押せるようにする。ブックマークもアイコン化。

- indexページにアイコン追加するためには、jsで書き直す。
リロードで先頭に行ってしまうので。

- userのアイコン作成  ←画像生成AIとか使えないかな。

- マイページ上に、twitter,youtube等のアカウントリンク表示したい。

- bookmarkカラム等に、has many :throughを記載しないといけないかもしれないので確認する。
https://higmonta.hatenablog.com/entry/2021/05/25/165758
- 記事の下書き保存ができる。
- 投稿時、カテゴリの登録ができる。
- カテゴリで、答案を選択した場合は、司法試験の問題と解説へのリンクを付与する。
- マイページの分析ボードについて
科目ごとの達成した記事を、githubの草みたいにしたい。投稿するモチベーションに繋がりそう。

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

# ドキュメント
https://github.com/nishikawa1031/mainApp

https://analytics.google.com/analytics/web/#/p347800174/reports/intelligenthome

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

## favicon
https://www.canva.com/search/templates?q=favicon