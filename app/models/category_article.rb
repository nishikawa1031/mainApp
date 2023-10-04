# frozen_string_literal: true

# == Schema Information
#
# Table name: category_articles
#
#  id          :bigint           not null, primary key
#  category_id :bigint           not null
#  article_id  :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CategoryArticle < ApplicationRecord
  belongs_to :category
  belongs_to :article
end
