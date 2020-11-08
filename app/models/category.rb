class Category < ApplicationRecord
    has_many :creatings
    has_many :articles, through: :creatings

    validates :name, presence: true, uniqueness: true, length: {minimum:3, maximum:20}

    scope :by_date, -> { order(created_at: :desc)}
    
    def to_s
        name
    end
end
