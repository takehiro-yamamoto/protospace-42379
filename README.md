## usersテーブル

| カラム名                | データ型   | 制約               |
| ------------------- | ------ | ---------------- |
| email               | string | NOT NULL, ユニーク制約 |
| encrypted_password  | string | NOT NULL         |
| name                | string | NOT NULL         |
| profile             | text   | NOT NULL         |
| occupation          | text   | NOT NULL         |
| position            | text   | NOT NULL         |

### アソシエーション(usersテーブル)
```ruby
has_many :prototypes, dependent: :destroy
has_many :comments, dependent: :destroy
```

### バリデーション(usersテーブル)
```ruby
validates :title, :catch_copy, :concept, :image, presence: true
```

## prototypesテーブル

| カラム名        | データ型       | 制約             |
| ----------- | ---------- | -------------- |
| title       | string     | NOT NULL       |
| catch_copy  | text       | NOT NULL       |
| concept     | text       | NOT NULL       |
| user        | references | NOT NULL, 外部キー |

### アソシエーション(prototypesテーブル)
```ruby
belongs_to :user
has_many :comments, dependent: :destroy
has_one_attached :image
```

### バリデーション(prototypesテーブル)
```ruby
validates :title, :catch_copy, :concept, :image, presence: true
```

## commentsテーブル

| カラム名      | データ型       | 制約             |
| --------- | ---------- | -------------- |
| content   | text       | NOT NULL       |
| prototype | references | NOT NULL, 外部キー |
| user      | references | NOT NULL, 外部キー |

### アソシエーション(commentsテーブル)
```ruby
belongs_to :user
belongs_to :prototype
```
### バリデーション(commentsテーブル)
```ruby
validates :content, presence: true
```