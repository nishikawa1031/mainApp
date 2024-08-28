# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    role { 'applicant' } # Default role
    sequence(:email) { |n| "user#{n}@example.com" }

    trait :admin do
      role { 'admin' }
    end

    trait :employee do
      role { 'employee' }
    end
  end
end
