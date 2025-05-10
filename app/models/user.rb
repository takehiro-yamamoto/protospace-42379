class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    validates :name, presence: true    # ユーザー名のバリデーション
    validates :profile, presence: true    # プロフィールのバリデーション
    validates :occupation, presence: true    # 所属のバリデーション
    validates :position, presence: true    # 役職のバリデーション
  
  # アソシエーションの設定
  has_many :prototypes # プロトタイプとの関連付け
  has_many :comments # コメントとの関連付け

end
