# frozen_string_literal: true

# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  article_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :bookmark do
    user { nil }
    article { nil }
  end
end
