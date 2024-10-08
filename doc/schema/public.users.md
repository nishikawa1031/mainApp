# public.users

## Description

アプリケーションのユーザー情報テーブル

## Columns

| Name | Type | Default | Nullable | Children | Parents | Comment |
| ---- | ---- | ------- | -------- | -------- | ------- | ------- |
| id | bigint | nextval('users_id_seq'::regclass) | false | [public.articles](public.articles.md) [public.bookmarks](public.bookmarks.md) [public.likes](public.likes.md) |  |  |
| email | varchar | ''::character varying | false |  |  | メールアドレス |
| created_at | timestamp(6) without time zone |  | false |  |  | 作成日時 |
| updated_at | timestamp(6) without time zone |  | false |  |  | 更新日時 |
| role | integer | 0 | false |  |  |  |
| username | varchar |  | true |  |  |  |
| avatar | varchar |  | true |  |  |  |
| rolable_type | varchar |  | true |  |  |  |
| rolable_id | bigint |  | true |  |  |  |
| uid | varchar |  | true |  |  |  |

## Constraints

| Name | Type | Definition |
| ---- | ---- | ---------- |
| users_pkey | PRIMARY KEY | PRIMARY KEY (id) |

## Indexes

| Name | Definition |
| ---- | ---------- |
| users_pkey | CREATE UNIQUE INDEX users_pkey ON public.users USING btree (id) |
| index_users_on_email | CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email) |
| index_users_on_rolable | CREATE INDEX index_users_on_rolable ON public.users USING btree (rolable_type, rolable_id) |

## Relations

![er](public.users.svg)

---

> Generated by [tbls](https://github.com/k1LoW/tbls)
