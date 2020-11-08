class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :creatings
  has_many :categories, through: :creatings
  validates :title, presence: true, length: {minimum:3, maximum:20}
  validates :body, presence: true

  scope :by_most_recent, -> { order(created_at: :desc)}

  def category_list
    self.categories.collect do |category|
      category.name
    end.join(", ")
  end

  def category_list=(categories_string)
    category_names = categories_string.split(",").collect {|s| s.strip.downcase}.uniq
    new_or_found_categories = category_names.collect {|name| Category.find_or_create_by(name: name)}
    self.categories = new_or_found_categories
  end
end
