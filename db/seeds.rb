# frozen_string_literal: true

# 織田信長の日記
user1 = User.create(email: 'test@example.com')
# カテゴリの作成
Category.create([
  { name: "エンジニア" },
  { name: "デザイナー" },
  { name: "営業" },
  # 必要に応じて追加
])

# 求人記事の作成
10.times do |index|
  article = Article.create(
    body: "求人記事本文 #{index + 1}",
    user_id: 1,  # 求人記事を作成するユーザーのID
    start_time: Date.current,
    end_time: Date.current + 1.month
  )

  # カテゴリの割り当て
  article.categories << Category.all.sample(2)  # ランダムに2つのカテゴリを割り当てる
end
