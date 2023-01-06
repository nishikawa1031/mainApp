# frozen_string_literal: true

class Article < ApplicationRecord
  enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }
  enum :subject, {
    civil_law: 0,
    constitution: 1,
    criminal_law: 2,
    civil_procedure_law: 3,
    criminal_procedure_law: 4,
    administrative_law: 5,
    company_law: 6,
    labor_law: 7,
    intellectual_property_law: 8,
    tax_law: 9,
    bankruptcy_law: 10,
    economic_law: 11,
    private_international_law: 12,
    public_international_law: 13,
    environmental_law: 14,
    others: 15
  }
  belongs_to :user
  has_many :category_articles
  has_many :categories, through: :category_articles

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  is_impressionable counter_cache: true, unique: true

  Colors = %w[blue indigo purple pink red orange yellow green teal cyan gray].freeze

  def liked_by?(user)
    likes.where(user_id: user).exists?
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
