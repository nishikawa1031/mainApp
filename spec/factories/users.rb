# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    role { 'general' }  # Default role

    trait :admin do
      role { 'admin' }
    end

    trait :employee do
      role { 'employee' }
    end
  end
end
