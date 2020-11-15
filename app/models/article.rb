class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :creatings
  has_many :categories, through: :creatings, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true, length: {minimum:3, maximum:50}
  validates :body, presence: true, length: {minimum:3}

  scope :by_most_recent, -> { order(created_at: :desc)}

  has_attached_file :image,
  :storage => :cloudinary,
  :path => ':class/:id/:style/:filename'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  
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
