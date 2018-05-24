class Post < ApplicationRecord
  #1:多の設定！
  # 投稿が消えたらそれに付随するコメントも消えるように設定！
  has_many :comments, dependent: :destroy

  # バリデーションの設定！(どういう内容だったらOK、これはNGとかを決める！)
  validates :title, presence: true, length:{minimum: 3, message: 'Too short to post!!'} #入力必須・3文字以上
  validates :body, presence: true #入力必須
end
