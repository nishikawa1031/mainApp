# frozen_string_literal: true

FactoryBot.define do
  factory :bookmark do
    user { nil }
    article { nil }
  end
end
