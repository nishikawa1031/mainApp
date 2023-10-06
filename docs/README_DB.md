-- userテーブル: ユーザー
CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- 他のカラムも必要に応じて追加
);

-- diaryテーブル: 日記
CREATE TABLE diary (
    id INT PRIMARY KEY AUTO_INCREMENT,
    text TEXT,
    user_id INT,
    start_time DATE,
    FOREIGN KEY (user_id) REFERENCES user(id)
);
-- diaryテーブルのuser_idカラムにインデックスを追加
CREATE INDEX idx_diary_user_id ON diary(user_id);

-- characterテーブル: 日記に登場する人物
CREATE TABLE character (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    creator_id INT, -- characterを作成したuserのid
    user_id INT NULL, -- characterがこの日記アプリのユーザーだった場合に、UserとCharacterを紐づける (NULL許容)
    FOREIGN KEY (creator_id) REFERENCES user(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);
-- characterテーブルのcreator_idとuser_idカラムにインデックスを追加
CREATE INDEX idx_character_creator_id ON character(creator_id);
CREATE INDEX idx_character_user_id ON character(user_id);

-- diary_charactersテーブル: 日記とそこに登場する人物を紐づける中間テーブル
CREATE TABLE diary_characters (
    id INT PRIMARY KEY AUTO_INCREMENT,
    diary_id INT,
    character_id INT,
    FOREIGN KEY (diary_id) REFERENCES diary(id),
    FOREIGN KEY (character_id) REFERENCES character(id)
);
-- diary_charactersテーブルのdiary_idとcharacter_idカラムにインデックスを追加
CREATE INDEX idx_dc_diary_id ON diary_characters(diary_id);
CREATE INDEX idx_dc_character_id ON diary_characters(character_id);

