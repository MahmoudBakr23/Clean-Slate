class User < ApplicationRecord
  has_many :articles, foreign_key: "author_id"
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 16 }
end
