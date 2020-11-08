class Like < ApplicationRecord
  validates :author_id, uniqueness: { scope: :article_id }
  belongs_to :author, class_name: "User"
  belongs_to :article
end
