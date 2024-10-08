# frozen_string_literal: true

# == Schema Information
#
# Table name: applicant_articles
#
#  id         :bigint           not null, primary key
#  person_id  :bigint           not null
#  article_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ApplicantArticle < ApplicationRecord
  belongs_to :applicant
  belongs_to :article
end
