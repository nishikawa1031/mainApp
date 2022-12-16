class Category < ApplicationRecord
    has_many :category_articles
    has_many :aricles, through: :category_articles
end
