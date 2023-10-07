# frozen_string_literal: true

# == Schema Information
#
# Table name: person_articles
#
#  id         :bigint           not null, primary key
#  person_id  :bigint           not null
#  article_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PersonArticle < ApplicationRecord
  belongs_to :person
  belongs_to :article
end
