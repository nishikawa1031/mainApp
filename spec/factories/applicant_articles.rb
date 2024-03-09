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
FactoryBot.define do
  factory :applicant_article do
    person { nil }
    article { nil }
  end
end
