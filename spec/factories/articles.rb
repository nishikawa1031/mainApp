# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id                :bigint           not null, primary key
#  title             :string
#  body              :text
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  comment           :text
#  impressions_count :integer          default(0)
#  file              :string
#  start_time        :datetime
#  end_time          :datetime
#
FactoryBot.define do
  factory :article do
    title { 'MyString' }
    body { 'MyText' }
    user { nil }
  end
end
