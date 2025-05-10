class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content, null: false # contentカラム追加
      t.references :user, foreign_key: true, null: false # user_idカラム追加(外部キー)
      t.references :prototype, foreign_key: true, null: false # prototype_idカラム追加(外部キー)
      t.timestamps
    end
  end
end
