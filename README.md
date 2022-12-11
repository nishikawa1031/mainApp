# DB構造
User id, name, 
Article id, title, body, category_id, user_id, status(published, draft)
ArticleCategory
Category id, name

rails generate scaffold Article title:string body:text status:integer user:references category:references
https://railstutorial.jp/chapters/user_microposts?version=6.0#sec-a_micropost_model


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
reactのmarkdownエディタのライブラリ
https://qiita.com/t_okkan/items/0a3318f90ee6c4468f82

エンジニアじゃないから、markdownはだめ。
action text で十分な気もする。
https://www.web-knowledge-info.com/wp/ruby-on-rails32/

action text css当てるのは自力でやらないといけないかも。
https://www.techscore.com/blog/2019/12/19/ruby-on-rails-6-action-text/


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
