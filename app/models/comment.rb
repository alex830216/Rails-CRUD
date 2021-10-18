class Comment < ApplicationRecord
  validates :commenter, presence: true,
                        length: { minimum: 3 }
  validates :text, presence: true
  belongs_to :product
end
