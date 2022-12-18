class Article < ApplicationRecord
  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }
  enum :subject, { others: 0, civil_law: 1, constitution: 2, criminal_law: 3, civil_procedure_law: 4, criminal_procedure_law: 5 }
  belongs_to :user
  has_many :category_articles
  has_many :categories, through: :category_articles
end
