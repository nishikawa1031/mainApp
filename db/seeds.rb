# frozen_string_literal: true

# 織田信長の日記
user1 = User.create(email: 'test@example.com', username: 'taroyama', password: 'password', password_confirmation: 'password')
user1.avatar.attach(io: File.open(Rails.root.join('app/assets/images/avatar.jpeg')), filename: 'avatar.jpeg')

## 明智光秀との面会に関する日記
nobunaga_meeting_mitsuhide_diary = Article.create(
  body: "今日は明智光秀と重要な面会を持った。彼の策略や智慧には常に感銘を受けている。しかし、彼の瞳には未解決の謎が隠れているようにも見える。我々の関係がこれからどのように展開していくのか、興味深く思う。",
  user_id: user1.id, # 織田信長のuser_id
  start_time: Time.zone.now - 2.days,
  end_time: Time.zone.now - 2.days + 2.hours
)

mitsuhide = Person.create(name: "明智光秀", user_id: 2, creater_id: user1.id)
PersonArticle.create(article_id: nobunaga_meeting_mitsuhide_diary.id, person_id: mitsuhide.id)

## 豊臣秀吉との面会に関する日記
nobunaga_meeting_hideyoshi_diary = Article.create(
  body: "今日は豊臣秀吉との重要な面会があった。彼の野心と実力は明らかで、我が信頼する部下として彼を見る。彼との共同作業はこの国の未来を形成するだろう。",
  user_id: user1.id, # 織田信長のuser_id
  start_time: Time.zone.now - 4.days,
  end_time: Time.zone.now - 4.days + 2.hours
)

hideyoshi = Person.create(name: "豊臣秀吉", user_id: 3, creater_id: user1.id)
PersonArticle.create(article_id: nobunaga_meeting_hideyoshi_diary.id, person_id: hideyoshi.id)

## 武田信玄との面会に関する日記
nobunaga_meeting_shingen_diary = Article.create(
  body: "武田信玄との対面はいつも緊張感が走る。彼の武勇と知略は我が敵として尊敬する。しかし、彼との共闘の可能性も考えられなくはない。",
  user_id: user1.id, # 織田信長のuser_id
  start_time: Time.zone.now - 7.days,
  end_time: Time.zone.now - 7.days + 2.hours
)

shingen = Person.create(name: "武田信玄", creater_id: user1.id)
PersonArticle.create(article_id: nobunaga_meeting_shingen_diary.id, person_id: shingen.id)

# 豊臣秀吉の日記
user2 = User.create(email: 'another_test@example.com', username: 'another_man', password: 'password2', password_confirmation: 'password2')

# 織田信長との面会に関する日記エントリの作成
hideyoshi_meeting_nobunaga_diary = Article.create(
  body: "今日、織田信長様との重要な会議があった。彼の大志と指導力は天下統一への道を明確に示している。彼のもとで働くことは、私にとって大きな誇りである。",
  user_id: user2.id,
  start_time: Time.zone.now - 5.days,
  end_time: Time.zone.now - 5.days + 2.hours
)

nobunaga2 = Person.create(name: '織田信長', creater_id: user2.id)
PersonArticle.create(article_id: hideyoshi_meeting_nobunaga_diary.id, person_id: nobunaga2.id)

# 明智光秀との面会に関する日記エントリの作成
hideyoshi_meeting_mitsuhide_diary = Article.create(
  body: "明智光秀との対話はいつも洞察に富んでいる。彼の戦術や思考は、戦場での成功に不可欠だ。しかし、彼には何か隠していることがあるようにも感じられる。",
  user_id: user2.id,
  start_time: Time.zone.now - 3.days,
  end_time: Time.zone.now - 3.days + 2.hours
)

mitsuhide2 = Person.create(name: '明智光秀', creater_id: user2.id)
PersonArticle.create(article_id: hideyoshi_meeting_mitsuhide_diary.id, person_id: mitsuhide2.id)

# 武田信玄との面会に関する日記エントリの作成
hideyoshi_meeting_shingen_diary = Article.create(
  body: "武田信玄との交渉は難しさを伴うものだった。彼の軍事的才能と戦略は非常に尊敬している。我々の間に協力の可能性があるかどうかは未だ不明だが、彼との関係を維持することは重要だ。",
  user_id: user2.id,
  start_time: Time.zone.now - 10.days,
  end_time: Time.zone.now - 10.days + 2.hours
)

shingen2 = Person.create(name: '武田信玄', creater_id: user2.id)
PersonArticle.create(article_id: hideyoshi_meeting_shingen_diary.id, person_id: shingen2.id)
