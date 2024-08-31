# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    name { 'MyString' }
    department { 'MyString' }
    position { 'MyString' }
    user_id { 1 }
  end
end
