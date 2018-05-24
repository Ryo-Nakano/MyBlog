class Comment < ApplicationRecord
  belongs_to :post #Postモデルに紐付けられている！
  validates :body, presence: true #入力必須
end
