class Article < ApplicationRecord
  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }
  belongs_to :user
  has_many :category_articles
  has_many :categories, through: :category_articles
end
