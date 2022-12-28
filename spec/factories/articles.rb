# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'MyString' }
    body { 'MyText' }
    status { 1 }
    user { nil }
  end
end
