class CreatePrototypes < ActiveRecord::Migration[7.1]
  def change
    create_table :prototypes do |t|
      t.string :title ,null: false # タイトル
      t.text :catch_copy, null: false # キャッチコピー
      t.text :concept, null: false # コンセプト
      t.references :user, null: false, foreign_key: true # ユーザーID
      t.timestamps
    end
  end
end
