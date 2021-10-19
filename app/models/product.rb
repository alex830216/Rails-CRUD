class Product < ApplicationRecord
  include Visible
  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :text, presence: true

  # has_many :comments，可以透過 @product.comments 用"陣列"來取得該產品的所有留言
  has_many :comments, dependent: :destroy
end
