class Prototype < ApplicationRecord
  has_one_attached :image # 画像の添付 「アソシエーション」の宣言
  belongs_to :user # ユーザーとの関連付け
  has_many :comments, dependent: :destroy # コメントとの関連付け

  validates :title, presence: true # タイトルのバリデーション
  validates :catch_copy, presence: true # キャッチコピーのバリデーション
  validates :concept, presence: true # コンセプトのバリデーション
  validates :image, presence: true # 画像のバリデーション
end
