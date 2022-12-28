# frozen_string_literal: true

class CategoryArticle < ApplicationRecord
  belongs_to :category
  belongs_to :article
end
